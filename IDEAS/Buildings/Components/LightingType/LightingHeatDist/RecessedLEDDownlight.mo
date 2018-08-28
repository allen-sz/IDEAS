within IDEAS.Buildings.Components.LightingType.LightingHeatDist;
record RecessedLEDDownlight "Recessed LED downlight"
  extends
    IDEAS.Buildings.Components.LightingType.BaseClasses.PartialLightingHeatDist(
      spaFra=0.48, radFra=0.17);

  annotation (Documentation(revisions="<html>
<ul>
<li>
August 28, 2018 by Iago Cupeiro:<br/>
First implementation
See <a href=\"https://github.com/open-ideas/IDEAS/issues/879\">#879</a>.
</li>
</ul>
</html>", info="<html>
<p>
Lighting gains distribution for recessed LED downlight
</p>
</html>"));
end RecessedLEDDownlight;
