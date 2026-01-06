generic configuration TempSensorC() {
  provides interface Read<uint16_t> as TempRead;
}
implementation {
  components new TempSensorP();
  components new TimerMilliC() as ReadTempTimer;

  TempRead = TempSensorP.TempRead;
  TempSensorP.TimerReadTemp -> ReadTempTimer;
}
