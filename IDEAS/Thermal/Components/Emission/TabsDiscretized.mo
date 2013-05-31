within IDEAS.Thermal.Components.Emission;
model TabsDiscretized "Discretized tabs system"

  extends IDEAS.Thermal.Components.Emission.Interfaces.Partial_Tabs;

  replaceable parameter IDEAS.Thermal.Components.BaseClasses.FH_Characteristics
                                                                       FHCharsDiscretized(A_Floor=
        A_Floor/n) constrainedby
    IDEAS.Thermal.Components.BaseClasses.FH_Characteristics(
      A_Floor=A_Floor/n);

  parameter Integer n(min=2)=2 "number of discrete elements";

  IDEAS.Thermal.Components.Emission.Tabs[
                                   n] tabs(
    each medium=medium,
    each A_Floor=A_Floor/n,
    each m_flowMin=m_flowMin,
    each FHChars=FHCharsDiscretized)
    annotation (Placement(transformation(extent={{-54,-8},{-34,12}})));

  Modelica.Thermal.HeatTransfer.Components.ThermalCollector thermalCollector(m=n)
    annotation (Placement(transformation(extent={{-54,52},{-34,32}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector thermalCollector1(m=n)
    annotation (Placement(transformation(extent={{-54,-46},{-34,-26}})));
equation
  connect(flowPort_a, tabs[1].flowPort_a) annotation (Line(
      points={{-100,40},{-76,40},{-76,6},{-54,6}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(tabs[n].flowPort_b, flowPort_b) annotation (Line(
      points={{-54,-2},{-76,-2},{-76,-40},{-100,-40}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(thermalCollector.port_b, port_a) annotation (Line(
      points={{-44,52},{-44,74},{0,74},{0,100}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(tabs.port_a, thermalCollector.port_a) annotation (Line(
      points={{-44,12},{-44,32}},
      color={191,0,0},
      smooth=Smooth.None));

  for i in 1:n-1 loop
    connect(tabs[i].flowPort_b,tabs[i+1].flowPort_a);
  end for;

  connect(tabs.port_b, thermalCollector1.port_a) annotation (Line(
      points={{-44,-7.8},{-44,-26}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalCollector1.port_b, port_b) annotation (Line(
      points={{-44,-46},{-44,-80},{0,-80},{0,-98}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics), Documentation(revisions="<html>
<p><ul>
<li>2013 May, Roel De Coninck: documentation</li>
<li>2012 April, Roel De Coninck: rebasing on common Partial_Emission</li>
<li>2011, Roel De Coninck: first version and validation</li>
</ul></p>
</html>"));
end TabsDiscretized;
