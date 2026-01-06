#include "Timer.h"
#include "Magt.h"

module MagtC {
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
    dbg("boot", "[Temp Sensor]: booted.\n");
    call RadioControl.start();
  }

  event void RadioControl.startDone(error_t err) {
    if (err == SUCCESS) {
      dbg("radio", "[Temp Sensor]: Radio on.\n");
      call MilliTimer.startPeriodic(1000);
    } else {
      dbg("radio", "[Temp Sensor]: Radio start failed: %hhu\n", err);
    }
  }

  event void RadioControl.stopDone(error_t err) {}

  event void MilliTimer.fired() {
    if (locked) {
      dbg("role", "[Temp Sensor]: busy (locked), skipping read.\n");
      return;
    }
    call Read.read();
  }

  event void Read.readDone(error_t result, uint16_t data) {
    if (result != SUCCESS) {
      dbg("role", "[Temp Sensor]: read failed: %hhu\n", result);
      return;
    }

    dbg("role", "[Temp Sensor]: sample=%u\n", data);

    magt_msg_t* out = (magt_msg_t*) call Packet.getPayload(&packet, sizeof(magt_msg_t));
    if (out == NULL) {
      dbg("radio_packet", "[Temp Sensor]: NULL payload.\n");
      return;
    }

    out->msg_type = MSG_TYPE_TEMP;
    out->data = data;

    if (call AMSend.send(AM_BROADCAST_ADDR, &packet, sizeof(magt_msg_t)) == SUCCESS) {
      locked = TRUE;
      dbg("radio", "[Temp Sensor]: sent.\n");
    } else {
      dbg("radio", "[Temp Sensor]: send failed.\n");
    }
  }

  event void AMSend.sendDone(message_t* bufPtr, error_t err) {
    if (bufPtr == &packet) {
      locked = FALSE;
      dbg("radio", "[Temp Sensor]: sendDone=%hhu (unlocked).\n", err);
    }
  }
}
