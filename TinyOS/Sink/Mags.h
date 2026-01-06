#ifndef MAGS_H
#define MAGS_H

// Serial payload sent by the Sink to the host (Node-RED) using SerialActiveMessage.
// Node-RED looks for SERIAL_MSG (0x89 == 137) in the TinyOS serial frame.
typedef nx_struct mags_msg {
  nx_uint16_t datat;  // temperature raw sample
  nx_uint16_t datah;  // humidity raw sample
} mags_msg_t;

// Radio payload received by the Sink from sensor nodes.
typedef nx_struct mag_msg {
  nx_uint8_t  msg_type; // 1=temp, 2=hum
  nx_uint16_t data;
} mag_msg_t;

enum {
  SERIAL_MSG    = 0x89,
  RADIO_MSG     = 6,
  MSG_TYPE_TEMP = 1,
  MSG_TYPE_HUM  = 2,
};

#endif
