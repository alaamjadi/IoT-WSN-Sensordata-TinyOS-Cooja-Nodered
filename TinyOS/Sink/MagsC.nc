#include "Timer.h"
#include "Mags.h"

module MagsC {
  uses {
    interface Boot;
    interface SplitControl as SerialControl;
    interface SplitControl as RadioControl;
    interface Receive;
    interface AMSend as SAMSend;
    interface Timer<TMilli> as MilliTimer;
    interface Packet as SPacket;
  }
}
implementation {

  message_t packet;
  bool locked = FALSE;

  // Store latest samples from the network
  uint16_t last_temp = 0;
  uint16_t last_hum  = 0;
  bool has_temp = FALSE;
  bool has_hum  = FALSE;

  task void sendResult();

  event void Boot.booted() {
    call SerialControl.start();
    call RadioControl.start();
  }

  event void SerialControl.startDone(error_t err) {}
  event void SerialControl.stopDone(error_t err) {}

  event void RadioControl.startDone(error_t err) {
    if (err == SUCCESS) {
      call MilliTimer.startPeriodic(1000);
    }
  }

  event void RadioControl.stopDone(error_t err) {}

  event void MilliTimer.fired() {
    if (locked) return;
    if (!has_temp && !has_hum) return;
    post sendResult();
  }

  event message_t* Receive.receive(message_t* bufPtr, void* payload, uint8_t len) {
    if (len != sizeof(mag_msg_t)) return bufPtr;

    mag_msg_t* in = (mag_msg_t*) payload;

    if (in->msg_type == MSG_TYPE_TEMP) {
      last_temp = in->data;
      has_temp = TRUE;
    } else if (in->msg_type == MSG_TYPE_HUM) {
      last_hum = in->data;
      has_hum = TRUE;
    }
    return bufPtr;
  }

  task void sendResult() {
    mags_msg_t* out = (mags_msg_t*) call SPacket.getPayload(&packet, sizeof(mags_msg_t));
    if (out == NULL) return;

    atomic {
      out->datat = last_temp;
      out->datah = last_hum;
    }

    if (call SAMSend.send(AM_BROADCAST_ADDR, &packet, sizeof(mags_msg_t)) == SUCCESS) {
      locked = TRUE;
    }
  }

  event void SAMSend.sendDone(message_t* bufPtr, error_t err) {
    if (bufPtr == &packet) {
      locked = FALSE;
    }
  }
}
