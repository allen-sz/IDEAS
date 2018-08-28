within IDEAS.Buildings.Components.LightingType.LightingSplit;
record HighBayLEDFixture "High-bay LED fixture"
  extends
    IDEAS.Buildings.Components.LightingType.BaseClasses.PartialLightingSplit(
      spaFra=1.00, radFra=0.47);

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
Lighting gains distribution for high-bay LED fixtures
</p>
</html>"));
end HighBayLEDFixture;
