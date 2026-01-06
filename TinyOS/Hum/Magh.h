#ifndef MAGH_H
#define MAGH_H

// Radio message sent by the Humidity node to the Sink.
// msg_type identifies which sensor produced the sample.
typedef nx_struct magh_msg {
  nx_uint8_t  msg_type;
  nx_uint16_t data;
} magh_msg_t;

enum {
  RADIO_MSG    = 6,
  MSG_TYPE_HUM = 2,
};

#endif
