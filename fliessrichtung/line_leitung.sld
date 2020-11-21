<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.0.0" 
                       xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" 
                       xmlns="http://www.opengis.net/sld" 
                       xmlns:ogc="http://www.opengis.net/ogc" 
                       xmlns:xlink="http://www.w3.org/1999/xlink" 
                       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <!-- a Named Layer is the basic building block of an SLD document -->
  <NamedLayer>
    <Name>default_line</Name>
    <UserStyle>
      <Title>Leitung mit Fliessrichtungspfeil (v1)</Title>
      <Abstract>Leitung mit Fliessrichtungspfeil (v1)</Abstract>

      <FeatureTypeStyle>
        <Rule>
          <Name>Blue_Arrow_Line</Name>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#0000FF</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
            </Stroke>
          </LineSymbolizer>
          <PointSymbolizer>
            <Geometry>
              <ogc:Function name="endPoint">
                <ogc:PropertyName>verlauf</ogc:PropertyName>
              </ogc:Function>
            </Geometry>
            <Graphic>
              <Mark>
                <WellKnownName>shape://oarrow</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#0000FF</CssParameter>
                  <CssParameter name="fill-opacity">0.5</CssParameter>
                </Fill>
                <Stroke>
                  <CssParameter name="stroke">#0000FF</CssParameter>
                  <CssParameter name="stroke-width">2</CssParameter>
                </Stroke>
              </Mark>
              <Size>30</Size>
              <Rotation>
                <ogc:Function name="endAngle">
                  <ogc:PropertyName>verlauf</ogc:PropertyName>
                </ogc:Function>
              </Rotation>
            </Graphic>
          </PointSymbolizer>
          <TextSymbolizer>
            <Label>
              <ogc:PropertyName>bezeichnung</ogc:PropertyName> 500 PVC <ogc:Literal>&#x2192;</ogc:Literal>
            </Label>
            <Font>
              <CssParameter name="font-family">DejaVu Sans</CssParameter>
              <CssParameter name="font-size">16</CssParameter>
              <CssParameter name="font-style">normal</CssParameter>
              <!--<CssParameter name="font-weight">bold</CssParameter>-->
            </Font>            
            <LabelPlacement>
              <LinePlacement>
                <PerpendicularOffset>
                  -10
                </PerpendicularOffset>
              </LinePlacement>
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#0000FF</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
            <VendorOption name="forceLeftToRight">false</VendorOption>

          </TextSymbolizer>

        </Rule>
      </FeatureTypeStyle>

    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>