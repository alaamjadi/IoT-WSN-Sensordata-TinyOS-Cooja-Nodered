#ifndef MAGT_H
#define MAGT_H

// Radio message sent by the Temperature node to the Sink.
// msg_type identifies which sensor produced the sample.
typedef nx_struct magt_msg {
  nx_uint8_t  msg_type;
  nx_uint16_t data;
} magt_msg_t;

enum {
  RADIO_MSG     = 6,
  MSG_TYPE_TEMP = 1,
};

#endif
