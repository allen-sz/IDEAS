within IDEAS.Fluid.Production;
model PerformanceMap1DProduction "Production model based on performance maps"

  extends BaseClasses.PartialHeater(
      QNomRef=data.QNomRef,
      etaRef=data.etaRef,
      TMax=data.TMax,
      TMin=data.TMin,
      modulationMin=data.modulationMin,
      modulationStart=data.modulationStart,
    redeclare BaseClasses.HeatSources.PerformanceMap1DHeatSource heatSource(
        redeclare package Medium = Medium, table=data.table));

  replaceable BaseClasses.PartialPerformanceMap1D data
    "Data file containing the performance map"
    annotation (Placement(transformation(extent={{-72,60},{-52,80}})), choicesAllMatching=true);
equation
  PEl = 7 + heatSource.modulation/100*(33 - 7);
  PFuel = heatSource.PFuel;

 annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Line(
          points={{-90,30},{-90,-30}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-70,30},{-70,-30}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-50,30},{-50,-30}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-100,20},{-46,20}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-100,0},{-22,0}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-100,-20},{-46,-20}},
          color={0,0,255},
          smooth=Smooth.None)}));
end PerformanceMap1DProduction;