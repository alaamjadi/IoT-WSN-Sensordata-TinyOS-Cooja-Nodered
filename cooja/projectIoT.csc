<?xml version="1.0" encoding="UTF-8"?>
<simconf>
  <project EXPORT="discard">[APPS_DIR]/mrm</project>
  <project EXPORT="discard">[APPS_DIR]/mspsim</project>
  <project EXPORT="discard">[APPS_DIR]/avrora</project>
  <project EXPORT="discard">[APPS_DIR]/serial_socket</project>
  <project EXPORT="discard">[APPS_DIR]/collect-view</project>
  <project EXPORT="discard">[APPS_DIR]/powertracker</project>
  <simulation>
    <title>TinyOS WSN → Node-RED Sensor Logger</title>
    <speedlimit>0.1</speedlimit>
    <randomseed>123456</randomseed>
    <motedelay_us>1000000</motedelay_us>
    <radiomedium>
      se.sics.cooja.radiomediums.UDGM
      <transmitting_range>50.0</transmitting_range>
      <interference_range>100.0</interference_range>
      <success_ratio_tx>1.0</success_ratio_tx>
      <success_ratio_rx>1.0</success_ratio_rx>
    </radiomedium>
    <events>
      <logoutput>40000</logoutput>
    </events>
    <motetype>
      se.sics.cooja.mspmote.SkyMoteType
      <identifier>sky1</identifier>
      <description>Sky Mote Type #sky1</description>
      <firmware EXPORT="copy">[CONFIG_DIR]/TinyOS/Hum/build/telosb/main.exe</firmware>
      <moteinterface>se.sics.cooja.interfaces.Position</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.RimeAddress</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.IPAddress</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.Mote2MoteRelations</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.MoteAttributes</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.MoteID</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.LED</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.Battery</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.Button</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.PIR</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SerialPort</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SkyButton</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SkyFlash</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SkyCoffeeFilesystem</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SkySerial</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SkyTemperature</moteinterface>
    </motetype>

    <motetype>
      se.sics.cooja.mspmote.SkyMoteType
      <identifier>sky2</identifier>
      <description>Sky Mote Type #sky2</description>
      <firmware EXPORT="copy">[CONFIG_DIR]/TinyOS/Temp/build/telosb/main.exe</firmware>
      <moteinterface>se.sics.cooja.interfaces.Position</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.RimeAddress</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.IPAddress</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.Mote2MoteRelations</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.MoteAttributes</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.MoteID</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.LED</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.Battery</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.Button</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.PIR</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SerialPort</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SkyButton</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SkyFlash</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SkyCoffeeFilesystem</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SkySerial</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SkyTemperature</moteinterface>
    </motetype>

    <motetype>
      se.sics.cooja.mspmote.SkyMoteType
      <identifier>sky3</identifier>
      <description>Sky Mote Type #sky3</description>
      <firmware EXPORT="copy">[CONFIG_DIR]/TinyOS/Sink/build/telosb/main.exe</firmware>
      <moteinterface>se.sics.cooja.interfaces.Position</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.RimeAddress</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.IPAddress</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.Mote2MoteRelations</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.MoteAttributes</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.MoteID</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.LED</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.Battery</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.Button</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.PIR</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SerialPort</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SkyButton</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SkyFlash</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SkyCoffeeFilesystem</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SkySerial</moteinterface>
      <moteinterface>se.sics.cooja.interfaces.SkyTemperature</moteinterface>
    </motetype>

    <mote>
      <breakpoints />
      <interfaces>
        <interface>
          se.sics.cooja.interfaces.Position
          <pos x="25.0" y="25.0" z="0.0" />
        </interface>
        <interface>
          se.sics.cooja.interfaces.RimeAddress
          <address>1.0</address>
        </interface>
        <interface>
          se.sics.cooja.interfaces.MoteID
          <id>1</id>
        </interface>
      </interfaces>
      <motetype_identifier>sky1</motetype_identifier>
    </mote>

    <mote>
      <breakpoints />
      <interfaces>
        <interface>
          se.sics.cooja.interfaces.Position
          <pos x="55.0" y="25.0" z="0.0" />
        </interface>
        <interface>
          se.sics.cooja.interfaces.RimeAddress
          <address>2.0</address>
        </interface>
        <interface>
          se.sics.cooja.interfaces.MoteID
          <id>2</id>
        </interface>
      </interfaces>
      <motetype_identifier>sky2</motetype_identifier>
    </mote>

    <mote>
      <breakpoints />
      <interfaces>
        <interface>
          se.sics.cooja.interfaces.Position
          <pos x="40.0" y="55.0" z="0.0" />
        </interface>
        <interface>
          se.sics.cooja.interfaces.RimeAddress
          <address>3.0</address>
        </interface>
        <interface>
          se.sics.cooja.interfaces.MoteID
          <id>3</id>
        </interface>
      </interfaces>
      <motetype_identifier>sky3</motetype_identifier>
    </mote>

    <logoutput>40000</logoutput>

    <notes>Open Tools → Serial Socket, select the Sink mote (sky3) and start a Server on port 60003. Node-RED connects as a TCP client to localhost:60003.</notes>
  </simulation>
</simconf>
