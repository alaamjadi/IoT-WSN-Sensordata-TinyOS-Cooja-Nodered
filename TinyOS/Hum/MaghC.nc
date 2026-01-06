#include "Timer.h"
#include "Magh.h"

module MaghC {
  uses {
    interface SplitControl as RadioControl;
    interface Boot;
    interface AMSend;
    interface Timer<TMilli> as MilliTimer;
    interface Packet;
    interface Read<uint16_t>;
  }
}
implementation {

  message_t packet;
  bool locked = FALSE;

  event void Boot.booted() {
    dbg("boot", "[Hum Sensor]: booted.\n");
    call RadioControl.start();
  }

  event void RadioControl.startDone(error_t err) {
    if (err == SUCCESS) {
      dbg("radio", "[Hum Sensor]: Radio on.\n");
      call MilliTimer.startPeriodic(1000);
    } else {
      dbg("radio", "[Hum Sensor]: Radio start failed: %hhu\n", err);
    }
  }

  event void RadioControl.stopDone(error_t err) {}

  event void MilliTimer.fired() {
    if (locked) {
      dbg("role", "[Hum Sensor]: busy (locked), skipping read.\n");
      return;
    }
    call Read.read();
  }

  event void Read.readDone(error_t result, uint16_t data) {
    if (result != SUCCESS) {
      dbg("role", "[Hum Sensor]: read failed: %hhu\n", result);
      return;
    }

    dbg("role", "[Hum Sensor]: sample=%u\n", data);

    magh_msg_t* out = (magh_msg_t*) call Packet.getPayload(&packet, sizeof(magh_msg_t));
    if (out == NULL) {
      dbg("radio_packet", "[Hum Sensor]: NULL payload.\n");
      return;
    }

    out->msg_type = MSG_TYPE_HUM;
    out->data = data;

    if (call AMSend.send(AM_BROADCAST_ADDR, &packet, sizeof(magh_msg_t)) == SUCCESS) {
      locked = TRUE;
      dbg("radio", "[Hum Sensor]: sent.\n");
    } else {
      dbg("radio", "[Hum Sensor]: send failed.\n");
    }
  }

  event void AMSend.sendDone(message_t* bufPtr, error_t err) {
    if (bufPtr == &packet) {
      locked = FALSE;
      dbg("radio", "[Hum Sensor]: sendDone=%hhu (unlocked).\n", err);
    }
  }
}
