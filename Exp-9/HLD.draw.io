<mxfile host="Electron" agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) draw.io/29.6.6 Chrome/144.0.7559.236 Electron/40.8.4 Safari/537.36" version="29.6.6">
  <diagram name="Page-1" id="b33c6C4eegBNtEWQxnMo">
    <mxGraphModel dx="2169" dy="1753" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="4681" pageHeight="3300" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-1" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;rounded=0;" value="&lt;font style=&quot;font-size: 20px;&quot;&gt;Functional requirements:&lt;/font&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;-user should be able to search an event based on some title , location and date&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;-user should be able to view the details of the events(seat , description , metadata)&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;-user should be able to do a booking for that event&lt;/font&gt;&lt;/div&gt;" vertex="1">
          <mxGeometry height="110" width="650" x="90" y="1000" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-2" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;rounded=0;" value="&lt;font style=&quot;font-size: 21px;&quot;&gt;Non functional requirements :&lt;/font&gt;&lt;div&gt;&lt;font style=&quot;font-size: 21px;&quot;&gt;- scale: 100M DAU&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 21px;&quot;&gt;-CAP theorem :&lt;br&gt;As per the CAP theorem we cannot achieve both high availability and high consistency for a particular part of the system so we have to do a tradeoff&lt;br&gt;and as per our requirementts for this particular application we need both&lt;br&gt;We need to achieve high availability for the searching and viewing event part of the system and we need to acheive high consistency for the ticket booking part of the system so that no two users are able to book the same ticket&amp;nbsp;&lt;/font&gt;&lt;/div&gt;" vertex="1">
          <mxGeometry height="210" width="660" x="110" y="1240" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-3" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="&lt;font style=&quot;font-size: 20px;&quot;&gt;Core Entities:&lt;br&gt;User&lt;br&gt;Event&lt;br&gt;Venue&lt;br&gt;Ticket&lt;/font&gt;" vertex="1">
          <mxGeometry height="120" width="610" x="660" y="1490" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-4" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="&lt;font style=&quot;font-size: 20px;&quot;&gt;API DESIGN:&lt;br&gt;&lt;br&gt;&lt;br&gt;1) GET : /v1/search?q={searchTerm}&amp;amp;location={location}&amp;amp;date={date}-&amp;gt; List&amp;lt;EventId&amp;gt; : Pagination&lt;/font&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;2) GET /v1/event/{eventId} -&amp;gt; Event details &amp;amp; location &amp;amp; Seats[ ]&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;3) POST /v1/Booking/reserve&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;{&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; List&amp;lt;Seat&amp;gt;Seats;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;}&lt;br&gt;POST : /v1/booking/confirm&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;{&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 20px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;BookinID, payment details&lt;/font&gt;&lt;/div&gt;&lt;div&gt;}&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;/div&gt;" vertex="1">
          <mxGeometry height="160" width="560" x="90" y="1730" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-5" parent="1" style="points=[];aspect=fixed;html=1;align=center;shadow=0;dashed=0;fillColor=#FF6A00;strokeColor=none;shape=mxgraph.alibaba_cloud.user;" value="" vertex="1">
          <mxGeometry height="60" width="60" x="450" y="2200" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-6" parent="1" style="points=[];aspect=fixed;html=1;align=center;shadow=0;dashed=0;fillColor=#FF6A00;strokeColor=none;shape=mxgraph.alibaba_cloud.user;" value="" vertex="1">
          <mxGeometry height="60" width="60" x="450" y="2280" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-7" parent="1" style="points=[];aspect=fixed;html=1;align=center;shadow=0;dashed=0;fillColor=#FF6A00;strokeColor=none;shape=mxgraph.alibaba_cloud.user;" value="" vertex="1">
          <mxGeometry height="60" width="60" x="450" y="2350" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-8" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="USERS" vertex="1">
          <mxGeometry height="30" width="60" x="450" y="2420" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-19" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-10" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" target="9sFj9oH2ioGxYBuYcPj6-15">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-21" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-10" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.75;exitDx=0;exitDy=0;" target="9sFj9oH2ioGxYBuYcPj6-20">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-10" parent="1" style="rounded=1;whiteSpace=wrap;html=1;" value="API GATEWAY&lt;div&gt;AUTHENTICATION&lt;br&gt;RATE LIMITING&lt;/div&gt;&lt;div&gt;ROUTING&lt;/div&gt;" vertex="1">
          <mxGeometry height="340" width="120" x="530" y="2140" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-11" parent="1" style="sketch=0;points=[[0,0,0],[0.25,0,0],[0.5,0,0],[0.75,0,0],[1,0,0],[0,1,0],[0.25,1,0],[0.5,1,0],[0.75,1,0],[1,1,0],[0,0.25,0],[0,0.5,0],[0,0.75,0],[1,0.25,0],[1,0.5,0],[1,0.75,0]];outlineConnect=0;fontColor=#232F3E;fillColor=#E7157B;strokeColor=#ffffff;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.api_gateway;" value="" vertex="1">
          <mxGeometry height="78" width="78" x="551" y="2170" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-12" parent="1" style="image;aspect=fixed;html=1;points=[];align=center;fontSize=12;image=img/lib/azure2/app_services/Search_Services.svg;" value="" vertex="1">
          <mxGeometry height="52" width="72" x="780" y="2060" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-13" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-10" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0;exitDx=0;exitDy=0;entryX=0;entryY=0.577;entryDx=0;entryDy=0;entryPerimeter=0;" target="9sFj9oH2ioGxYBuYcPj6-12">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-14" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="Search Service" vertex="1">
          <mxGeometry height="140" width="60" x="787" y="2050" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-15" parent="1" style="sketch=0;outlineConnect=0;fontColor=#232F3E;gradientColor=none;fillColor=#E7157B;strokeColor=none;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;pointerEvents=1;shape=mxgraph.aws4.event;" value="" vertex="1">
          <mxGeometry height="78" width="78" x="777" y="2202" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-18" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;EVENT SERVICE" vertex="1">
          <mxGeometry height="144" width="60" x="791" y="2156" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-20" parent="1" style="image;aspect=fixed;html=1;points=[];align=center;fontSize=12;image=img/lib/azure2/general/Reservations.svg;" value="" vertex="1">
          <mxGeometry height="68" width="68" x="787" y="2420" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-22" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="Reservation service" vertex="1">
          <mxGeometry height="30" width="60" x="795" y="2500" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-23" parent="1" style="image;aspect=fixed;html=1;points=[];align=center;fontSize=12;image=img/lib/azure2/databases/Azure_Database_PostgreSQL_Server.svg;" value="" vertex="1">
          <mxGeometry height="64" width="48" x="970" y="2216" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-24" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-14" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.25;exitDx=0;exitDy=0;entryX=0.403;entryY=-0.009;entryDx=0;entryDy=0;entryPerimeter=0;" target="9sFj9oH2ioGxYBuYcPj6-23">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-25" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-18" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0.006;entryY=0.276;entryDx=0;entryDy=0;entryPerimeter=0;" target="9sFj9oH2ioGxYBuYcPj6-23">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-26" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-22" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.25;exitDx=0;exitDy=0;entryX=0.417;entryY=1;entryDx=0;entryDy=0;entryPerimeter=0;" target="9sFj9oH2ioGxYBuYcPj6-23">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-28" parent="1" style="points=[];aspect=fixed;html=1;align=center;shadow=0;dashed=0;fillColor=#FF6A00;strokeColor=none;shape=mxgraph.alibaba_cloud.user;" value="" vertex="1">
          <mxGeometry height="60" width="60" x="630" y="2980" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-29" parent="1" style="points=[];aspect=fixed;html=1;align=center;shadow=0;dashed=0;fillColor=#FF6A00;strokeColor=none;shape=mxgraph.alibaba_cloud.user;" value="" vertex="1">
          <mxGeometry height="60" width="60" x="630" y="3060" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-30" parent="1" style="points=[];aspect=fixed;html=1;align=center;shadow=0;dashed=0;fillColor=#FF6A00;strokeColor=none;shape=mxgraph.alibaba_cloud.user;" value="" vertex="1">
          <mxGeometry height="60" width="60" x="630" y="3130" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-31" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="USERS" vertex="1">
          <mxGeometry height="30" width="60" x="630" y="3200" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-32" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-34" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" target="9sFj9oH2ioGxYBuYcPj6-39">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-33" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-34" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.75;exitDx=0;exitDy=0;" target="9sFj9oH2ioGxYBuYcPj6-41">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-34" parent="1" style="rounded=1;whiteSpace=wrap;html=1;" value="API GATEWAY&lt;div&gt;AUTHENTICATION&lt;br&gt;RATE LIMITING&lt;/div&gt;&lt;div&gt;ROUTING&lt;/div&gt;" vertex="1">
          <mxGeometry height="340" width="120" x="710" y="2920" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-35" parent="1" style="sketch=0;points=[[0,0,0],[0.25,0,0],[0.5,0,0],[0.75,0,0],[1,0,0],[0,1,0],[0.25,1,0],[0.5,1,0],[0.75,1,0],[1,1,0],[0,0.25,0],[0,0.5,0],[0,0.75,0],[1,0.25,0],[1,0.5,0],[1,0.75,0]];outlineConnect=0;fontColor=#232F3E;fillColor=#E7157B;strokeColor=#ffffff;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.api_gateway;" value="" vertex="1">
          <mxGeometry height="78" width="78" x="731" y="2950" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-36" parent="1" style="image;aspect=fixed;html=1;points=[];align=center;fontSize=12;image=img/lib/azure2/app_services/Search_Services.svg;" value="" vertex="1">
          <mxGeometry height="52" width="72" x="960" y="2840" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-37" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-34" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0;exitDx=0;exitDy=0;entryX=0;entryY=0.577;entryDx=0;entryDy=0;entryPerimeter=0;" target="9sFj9oH2ioGxYBuYcPj6-36">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-54" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-38" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0;exitDx=0;exitDy=0;" target="9sFj9oH2ioGxYBuYcPj6-53">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-38" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="Search Service" vertex="1">
          <mxGeometry height="140" width="60" x="967" y="2830" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-39" parent="1" style="sketch=0;outlineConnect=0;fontColor=#232F3E;gradientColor=none;fillColor=#E7157B;strokeColor=none;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;pointerEvents=1;shape=mxgraph.aws4.event;" value="" vertex="1">
          <mxGeometry height="78" width="78" x="957" y="2982" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-49" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-40" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="1310" y="3045" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-40" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;EVENT SERVICE" vertex="1">
          <mxGeometry height="144" width="60" x="971" y="2936" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-80" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-42" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" target="9sFj9oH2ioGxYBuYcPj6-79">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-81" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-42" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=1;exitDx=0;exitDy=0;">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="1270" y="3380" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-42" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="Reservation service" vertex="1">
          <mxGeometry height="30" width="60" x="975" y="3280" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-43" parent="1" style="image;aspect=fixed;html=1;points=[];align=center;fontSize=12;image=img/lib/azure2/databases/Azure_Database_PostgreSQL_Server.svg;" value="" vertex="1">
          <mxGeometry height="64" width="48" x="1412" y="3200" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-46" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-42" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.25;exitDx=0;exitDy=0;entryX=0.417;entryY=1;entryDx=0;entryDy=0;entryPerimeter=0;" target="9sFj9oH2ioGxYBuYcPj6-43">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-50" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="EVENT&lt;br&gt;-ID&lt;div&gt;-VENUE&lt;/div&gt;&lt;div&gt;-ARTISTID&lt;/div&gt;&lt;div&gt;-NAME&lt;/div&gt;&lt;div&gt;-DESCRIPTION&lt;/div&gt;&lt;div&gt;-SEAT[&lt;/div&gt;" vertex="1">
          <mxGeometry height="63" width="160" x="1350" y="3037" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-53" parent="1" style="sketch=0;outlineConnect=0;fontColor=#232F3E;gradientColor=none;strokeColor=#ffffff;fillColor=#232F3E;dashed=0;verticalLabelPosition=middle;verticalAlign=bottom;align=center;html=1;whiteSpace=wrap;fontSize=10;fontStyle=1;spacing=3;shape=mxgraph.aws4.productIcon;prIcon=mxgraph.aws4.elasticsearch_service;" value="Amazon Elasticsearch Service" vertex="1">
          <mxGeometry height="120" width="80" x="1160" y="2730" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-56" parent="1" style="sketch=0;outlineConnect=0;fontColor=#232F3E;gradientColor=none;fillColor=#7AA116;strokeColor=none;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;pointerEvents=1;shape=mxgraph.aws4.connector;" value="" vertex="1">
          <mxGeometry height="41" width="110.28" x="1500" y="2892" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-57" parent="1" style="sketch=0;aspect=fixed;pointerEvents=1;shadow=0;dashed=0;html=1;strokeColor=none;labelPosition=center;verticalLabelPosition=bottom;verticalAlign=top;align=center;fillColor=#00188D;shape=mxgraph.azure.queue_generic" value="" vertex="1">
          <mxGeometry height="47" width="156.67" x="1440" y="2750" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-59" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-57" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0.91;exitY=0;exitDx=0;exitDy=0;exitPerimeter=0;entryX=0.91;entryY=0;entryDx=0;entryDy=0;entryPerimeter=0;" target="9sFj9oH2ioGxYBuYcPj6-57">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-60" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-90" style="endArrow=classic;html=1;rounded=0;" target="9sFj9oH2ioGxYBuYcPj6-56" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry">
            <mxPoint x="1360" y="2970" as="sourcePoint" />
            <mxPoint x="1420" y="2940" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-63" edge="1" parent="1" source="9sFj9oH2ioGxYBuYcPj6-56" style="endArrow=classic;html=1;rounded=0;" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry">
            <mxPoint x="1460" y="2850" as="sourcePoint" />
            <mxPoint x="1500" y="2810" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-65" edge="1" parent="1" style="endArrow=classic;startArrow=classic;html=1;rounded=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;entryPerimeter=0;" target="9sFj9oH2ioGxYBuYcPj6-57" value="">
          <mxGeometry height="50" relative="1" width="50" as="geometry">
            <mxPoint x="1240" y="2780" as="sourcePoint" />
            <mxPoint x="1430" y="2770" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-70" parent="1" style="shape=partialRectangle;whiteSpace=wrap;html=1;bottom=0;right=0;fillColor=none;" value="" vertex="1">
          <mxGeometry height="250" width="280" x="1350" y="2700" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-71" parent="1" style="shape=partialRectangle;whiteSpace=wrap;html=1;top=0;left=0;fillColor=none;" value="" vertex="1">
          <mxGeometry height="252" width="310" x="1350" y="2698" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-72" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="CDC Pipeline" vertex="1">
          <mxGeometry height="140" width="60" x="1670" y="2793" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-73" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="Connector service (Keeps looking for CHANGES in hhe main database" vertex="1">
          <mxGeometry height="120" width="210" x="1460" y="2908" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-77" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="Changes are migrated to elastic search" vertex="1">
          <mxGeometry height="30" width="200" x="1280" y="2740" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-79" parent="1" style="html=1;whiteSpace=wrap;strokeColor=none;fillColor=#0079D6;labelPosition=center;verticalLabelPosition=middle;verticalAlign=top;align=center;fontSize=12;outlineConnect=0;spacingTop=-6;fontColor=#FFFFFF;sketch=0;shape=mxgraph.sitemap.payment;" value="Payment" vertex="1">
          <mxGeometry height="70" width="120" x="934" y="3450" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-82" parent="1" style="image;sketch=0;aspect=fixed;html=1;points=[];align=center;fontSize=12;image=img/lib/mscae/Cache_Redis_Product.svg;" value="" vertex="1">
          <mxGeometry height="70" width="83.33" x="1230" y="3380" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-83" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="Redis Cluster" vertex="1">
          <mxGeometry height="30" width="60" x="1230" y="3460" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-84" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="Bookings DB" vertex="1">
          <mxGeometry height="30" width="150" x="1430" y="3217" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-90" parent="1" style="image;aspect=fixed;html=1;points=[];align=center;fontSize=12;image=img/lib/azure2/other/Managed_Instance_Apache_Cassandra.svg;" value="" vertex="1">
          <mxGeometry height="68" width="68" x="1320" y="3013.5" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-91" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="Cassandra&amp;nbsp;" vertex="1">
          <mxGeometry height="30" width="60" x="1300" y="3070" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-95" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="Payment service" vertex="1">
          <mxGeometry height="30" width="110" x="939" y="3520" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-97" parent="1" style="swimlane;startSize=0;" value="" vertex="1">
          <mxGeometry height="1090" width="1780" x="370" y="2560" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-92" parent="9sFj9oH2ioGxYBuYcPj6-97" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="This Redis cluster is used to store currently processing bookings with TTL when a user books a seat is it stored in the redis cluster with a TTL and if another user tries to book the same seat in the meanwhile the booking service first checks if the seat is present in the redis cluster and if it is the other user cannot book the seat if the payment succeeds it is removed from the redis and is marked as permanently confimed in the Database and if the payment fails it is removed automatically after the expiration time and then some other user can book this seat" vertex="1">
          <mxGeometry height="30" width="430" x="950.14" y="860" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-78" edge="1" parent="9sFj9oH2ioGxYBuYcPj6-97" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="665" y="670" />
              <mxPoint x="1005" y="670" />
            </Array>
            <mxPoint x="665" y="710" as="sourcePoint" />
            <mxPoint x="1005" y="540" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-41" parent="9sFj9oH2ioGxYBuYcPj6-97" style="image;aspect=fixed;html=1;points=[];align=center;fontSize=12;image=img/lib/azure2/general/Reservations.svg;" value="" vertex="1">
          <mxGeometry height="68" width="68" x="620" y="640" as="geometry" />
        </mxCell>
        <mxCell id="9sFj9oH2ioGxYBuYcPj6-99" parent="9sFj9oH2ioGxYBuYcPj6-97" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;rounded=0;" value="&lt;div&gt;&lt;font style=&quot;font-size: 16px;&quot;&gt;1. Create Reservation (Seat Locked in Redis)&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 16px;&quot;&gt;2. Initiate Payment&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 16px;&quot;&gt;3. Payment Processing&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 16px;&quot;&gt;4A. Payment Success → Confirm Booking&lt;/font&gt;&lt;/div&gt;&lt;div&gt;&lt;font style=&quot;font-size: 16px;&quot;&gt;4B. Payment Failed → Release Seat&lt;/font&gt;&lt;/div&gt;" vertex="1">
          <mxGeometry height="140" width="370" x="280" y="720" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>