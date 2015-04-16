within IDEAS.Fluid.Production.Interfaces;
partial model PartialHeaterTwoPort
  extends IDEAS.Fluid.Interfaces.TwoPortHeatMassExchanger(
  redeclare final IDEAS.Fluid.MixingVolumes.MixingVolume vol(
    nPorts=3,
    V=mWater/rho_default),
  final showDesignFlowDirection=true);

  extends PartialHeater(
    hIn(y=inStream(port_a.h_outflow)),
    mFlowSecondary(y=port_a.m_flow),
    heatSource(
      m_flow_nominal=m_flow_nominal,
      redeclare package Medium=Medium,
      useTinPrimary=false,
      useToutPrimary=false,
      useMassFlowPrimary=false),
    qAsked(redeclare package Medium = Medium));

equation
  connect(vol.heatPort, thermalLosses.port_a) annotation (Line(
      points={{-9,-10},{-36,-10},{-36,-32}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end PartialHeaterTwoPort;
