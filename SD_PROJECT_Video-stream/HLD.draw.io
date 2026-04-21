<mxfile host="app.diagrams.net">
  <diagram name="Step 1: MVP" id="6ETzK9pB0bcGWIJBpP1b">
    <mxGraphModel dx="2143" dy="851" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="850" pageHeight="1100" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="jUT0NAQbRsZXok18yd4u-1" parent="1" style="shape=image;fillColor=#eeeeee;verticalLabelPosition=bottom;verticalAlign=top;image=img/lib/active_directory/users.svg;" value="Clients" vertex="1">
          <mxGeometry height="100" width="100" x="500" y="2928" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-2" parent="1" style="shape=mxgraph.aws4.endpoint;fillColor=#E7157B;verticalLabelPosition=bottom;verticalAlign=top;fontColor=#232F3E;" value="API Gateway" vertex="1">
          <mxGeometry height="90" width="90" x="750" y="2933" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-3" parent="1" style="shape=image;fillColor=#dae8fc;verticalLabelPosition=bottom;verticalAlign=top;image=img/lib/azure2/identity/Multi_Factor_Authentication.svg;" value="Auth Service" vertex="1">
          <mxGeometry height="80" width="80" x="1000" y="2778" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-4" parent="1" style="shape=mxgraph.ios7.icons.share;fillColor=#dae8fc;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=#0080F0;strokeWidth=2;" value="Upload Service" vertex="1">
          <mxGeometry height="80" width="80" x="1000" y="2938" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-5" parent="1" style="shape=mxgraph.aws4.resourceIcon;fillColor=#ED7100;verticalLabelPosition=bottom;verticalAlign=top;resIcon=mxgraph.aws4.kinesis_video_streams;strokeColor=#ffffff;" value="Video Metadata" vertex="1">
          <mxGeometry height="80" width="80" x="1335" y="2938" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-6" parent="1" style="shape=image;fillColor=#d5e8d4;verticalLabelPosition=bottom;verticalAlign=top;image=img/lib/active_directory/database_cube.svg;" value="Video DB" vertex="1">
          <mxGeometry height="90" width="90" x="1500" y="2933" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-7" parent="1" style="shape=mxgraph.alibaba_cloud.oss_object_storage_service;fillColor=#FF6A00;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none;" value="Object Storage" vertex="1">
          <mxGeometry height="90" width="90" x="1245" y="3078" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-8" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-1" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-2">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-9" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-2" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-3">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="950" y="2978" />
              <mxPoint x="950" y="2818" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-10" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-2" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-4">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-11" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-4" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-5">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-12" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-5" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-6">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-13" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-4" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-7" value="Sync Upload (Blocks Client)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-14" parent="1" style="text;html=1;whiteSpace=wrap;align=left;spacing=15;fontSize=14;fillColor=#f5f5f5;fontColor=#333333;strokeColor=#666666;" value="&lt;b style=&#39;font-size:16px;&#39;&gt;ISSUE:&lt;/b&gt;&lt;br&gt;Uploading heavy 5GB video files through the API Gateway causes severe bottlenecks, high bandwidth costs, and server timeouts. Furthermore, synchronous video processing means the user is stuck waiting on a loading screen forever.&lt;br&gt;&lt;br&gt;&lt;b style=&#39;font-size:16px;&#39;&gt;SOLUTION:&lt;/b&gt;&lt;br&gt;Decouple uploads! Implement the Pre-Signed URL pattern so clients upload directly to Object Storage. Introduce a Global CDN for fast downloads, and an Event Queue (Kafka) for asynchronous background video transcoding." vertex="1">
          <mxGeometry height="150" width="1090" x="500" y="3278" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-15" parent="1" style="shape=image;fillColor=#eeeeee;verticalLabelPosition=bottom;verticalAlign=top;image=img/lib/active_directory/users.svg;" value="Clients" vertex="1">
          <mxGeometry height="100" width="100" x="424" y="3735" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-16" parent="1" style="shape=image;fillColor=#ffe6cc;verticalLabelPosition=bottom;verticalAlign=top;image=img/lib/azure2/app_services/CDN_Profiles.svg;" value="Global CDN" vertex="1">
          <mxGeometry height="90" width="90" x="674" y="3885" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-17" parent="1" style="shape=mxgraph.aws4.endpoint;fillColor=#E7157B;verticalLabelPosition=bottom;verticalAlign=top;fontColor=#232F3E;" value="API Gateway" vertex="1">
          <mxGeometry height="90" width="90" x="674" y="3590" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-18" parent="1" style="shape=mxgraph.ios7.icons.share;fillColor=#dae8fc;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=#0080F0;strokeWidth=2;" value="Upload Service&#xa;(Pre-Signed URLs)" vertex="1">
          <mxGeometry height="80" width="80" x="924" y="3595" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-19" parent="1" style="shape=mxgraph.aws4.resourceIcon;fillColor=#ED7100;verticalLabelPosition=bottom;verticalAlign=top;resIcon=mxgraph.aws4.kinesis_video_streams;strokeColor=#ffffff;" value="Video Metadata" vertex="1">
          <mxGeometry height="80" width="80" x="1174" y="3595" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-20" parent="1" style="shape=image;fillColor=#d5e8d4;verticalLabelPosition=bottom;verticalAlign=top;image=img/lib/active_directory/database_cube.svg;" value="Video DB" vertex="1">
          <mxGeometry height="90" width="90" x="1424" y="3590" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-21" parent="1" style="shape=mxgraph.alibaba_cloud.oss_object_storage_service;fillColor=#FF6A00;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none;" value="Object Storage" vertex="1">
          <mxGeometry height="90" width="90" x="1169" y="3885" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-22" parent="1" style="shape=mxgraph.aws4.resourceIcon;fillColor=#8C4FFF;verticalLabelPosition=bottom;verticalAlign=top;resIcon=mxgraph.aws4.managed_streaming_for_kafka;strokeColor=#ffffff;" value="Kafka Queue" vertex="1">
          <mxGeometry height="90" width="90" x="1424" y="3885" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-23" parent="1" style="shape=mxgraph.alibaba_cloud.gts_global_transaction_service;fillColor=#FF6A00;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none;" value="Transcoders" vertex="1">
          <mxGeometry height="90" width="90" x="1674" y="3885" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-24" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-15" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-17" value="Get URL">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="474" y="3635" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-25" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-17" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-18">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-26" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-18" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-19">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-27" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-19" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-20">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-28" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-15" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-21" value="Direct Upload via Pre-Signed URL">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="474" y="3845" />
              <mxPoint x="1214" y="3845" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-29" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-15" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-16" value="Watch">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="474" y="3930" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-30" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-16" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-21" value="Cache Miss">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-31" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-21" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-22" value="Upload Event">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-32" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-22" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-23">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-33" parent="1" style="text;html=1;whiteSpace=wrap;align=left;fillColor=#f5f5f5;strokeColor=#666666;spacing=15;fontSize=14;fontColor=#333333;" value="&lt;b style=&#39;font-size:16px;&#39;&gt;ISSUE:&lt;/b&gt;&lt;br&gt;Our video pipeline is now decoupled and smooth. However, when a video goes viral, millions of social interactions (Likes, Comments, Searches) hit the system simultaneously. Routing all this interactive traffic directly to our single SQL Video Database will cause deadlocks, latency spikes, and eventual system failure.&lt;br&gt;&lt;br&gt;&lt;b style=&#39;font-size:16px;&#39;&gt;SOLUTION:&lt;/b&gt;&lt;br&gt;Break down interactive features into Microservices. Use Redis (in-memory) for high-speed Like counters, a NoSQL Cluster (DynamoDB) for Comments, and ElasticSearch for fast text queries. We also need WebSockets for real-time notifications." vertex="1">
          <mxGeometry height="150" width="1340" x="424" y="4085" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-34" parent="1" style="shape=image;fillColor=#eeeeee;verticalLabelPosition=bottom;verticalAlign=top;image=img/lib/active_directory/users.svg;" value="Clients" vertex="1">
          <mxGeometry height="100" width="100" x="679" y="4686.139999999999" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-35" parent="1" style="shape=mxgraph.aws3.traditional_server;fillColor=#7D7C7C;verticalLabelPosition=bottom;verticalAlign=top;" value="WebSocket Gateway" vertex="1">
          <mxGeometry height="90" width="90" x="929" y="4836.139999999999" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-36" parent="1" style="shape=mxgraph.aws4.endpoint;fillColor=#E7157B;verticalLabelPosition=bottom;verticalAlign=top;fontColor=#232F3E;" value="API Gateway" vertex="1">
          <mxGeometry height="90" width="90" x="929" y="4541.139999999999" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-37" parent="1" style="shape=mxgraph.gcp2.thumbs_up;fillColor=#3B8DF1;verticalLabelPosition=bottom;verticalAlign=top;" value="Like Service" vertex="1">
          <mxGeometry height="80" width="80" x="1179" y="4546.139999999999" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-38" parent="1" style="shape=mxgraph.ios7.icons.message;fillColor=#dae8fc;verticalLabelPosition=bottom;verticalAlign=top;strokeWidth=2;strokeColor=#0080F0;" value="Comment Service" vertex="1">
          <mxGeometry height="80" width="80" x="1179" y="4696.139999999999" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-39" parent="1" style="shape=image;fillColor=#dae8fc;verticalLabelPosition=bottom;verticalAlign=top;image=img/lib/azure2/app_services/Search_Services.svg;" value="Search Service" vertex="1">
          <mxGeometry height="80" width="80" x="1179" y="4841.139999999999" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-40" parent="1" style="shape=image;fillColor=#d5e8d4;verticalLabelPosition=bottom;verticalAlign=top;image=img/lib/mscae/Cache_Redis_Product.svg;" value="Redis Cluster" vertex="1">
          <mxGeometry height="80" width="80" x="1429" y="4546.139999999999" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-41" parent="1" style="shape=image;fillColor=#d5e8d4;verticalLabelPosition=bottom;verticalAlign=top;image=img/lib/clip_art/computers/Database_128x128.png;" value="Comment DB" vertex="1">
          <mxGeometry height="80" width="80" x="1429" y="4696.139999999999" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-42" parent="1" style="shape=mxgraph.aws3.elasticsearch_service;fillColor=#F58534;verticalLabelPosition=bottom;verticalAlign=top;" value="ElasticSearch" vertex="1">
          <mxGeometry height="80" width="80" x="1429" y="4841.139999999999" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-43" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-34" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-36">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="729" y="4586.139999999999" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-44" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-34" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-35">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="729" y="4881.139999999999" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-45" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-36" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-37">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-46" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-36" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-38">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1069" y="4586.139999999999" />
              <mxPoint x="1069" y="4736.139999999999" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-47" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-36" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-39">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1069" y="4586.139999999999" />
              <mxPoint x="1069" y="4881.139999999999" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-48" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-37" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-40" value="Increment">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-49" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-38" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-41">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-50" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-39" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-42">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-51" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-40" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-35" value="Pub/Sub">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1469" y="4486.139999999999" />
              <mxPoint x="974" y="4486.139999999999" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-52" parent="1" style="text;html=1;whiteSpace=wrap;align=left;fillColor=#f5f5f5;strokeColor=#666666;spacing=15;fontSize=14;fontColor=#333333;" value="&lt;b style=&#39;font-size:16px;&#39;&gt;ISSUE:&lt;/b&gt;&lt;br&gt;Redis is great for Likes, but &#39;Views&#39; happen at an exponentially higher rate. Writing every single view to a database or cache will still overwhelm the system. Additionally, loading 50 heavy video segments just to display a 50kb thumbnail image on the homepage is incredibly inefficient.&lt;br&gt;&lt;br&gt;&lt;b style=&#39;font-size:16px;&#39;&gt;SOLUTION:&lt;/b&gt;&lt;br&gt;Build a Stream Processing Pipeline (Apache Flink reading from Kafka) to aggregate and batch &#39;Views&#39; before writing them to a Time-Series Database (Cassandra). Also, isolate Thumbnails into their own optimized storage and CDN path." vertex="1">
          <mxGeometry height="150" width="1090" x="549" y="5020" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-53" parent="1" style="shape=mxgraph.aws4.endpoint;fillColor=#E7157B;verticalLabelPosition=bottom;verticalAlign=top;fontColor=#232F3E;" value="API Gateway" vertex="1">
          <mxGeometry height="90" width="90" x="410" y="5380" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-54" parent="1" style="shape=mxgraph.gcp2.view_list;fillColor=#3B8DF1;verticalLabelPosition=bottom;verticalAlign=top;" value="View Service" vertex="1">
          <mxGeometry height="80" width="65" x="660" y="5385" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-55" parent="1" style="shape=mxgraph.aws4.resourceIcon;fillColor=#8C4FFF;verticalLabelPosition=bottom;verticalAlign=top;resIcon=mxgraph.aws4.managed_streaming_for_kafka;strokeColor=#ffffff;" value="Kafka Queue" vertex="1">
          <mxGeometry height="90" width="90" x="860" y="5380" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-56" parent="1" style="shape=mxgraph.aws4.resourceIcon;fillColor=#8C4FFF;verticalLabelPosition=bottom;verticalAlign=top;resIcon=mxgraph.aws4.managed_service_for_apache_flink;strokeColor=#ffffff;" value="Apache Flink" vertex="1">
          <mxGeometry height="90" width="90" x="1110" y="5380" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-57" parent="1" style="shape=image;fillColor=#d5e8d4;verticalLabelPosition=bottom;verticalAlign=top;image=img/lib/active_directory/database.svg;" value="View DB (Cassandra)" vertex="1">
          <mxGeometry height="80" width="108" x="1360" y="5385" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-58" parent="1" style="shape=mxgraph.alibaba_cloud.gts_global_transaction_service;fillColor=#FF6A00;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none;" value="Transcoders" vertex="1">
          <mxGeometry height="90" width="90" x="660" y="5625" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-59" parent="1" style="shape=mxgraph.alibaba_cloud.imagesearch;fillColor=#FF6A00;verticalLabelPosition=bottom;verticalAlign=top;strokeColor=none;" value="Thumbnail Storage" vertex="1">
          <mxGeometry height="90" width="90" x="1110" y="5625" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-60" parent="1" style="shape=mxgraph.aws4.resourceIcon;fillColor=#ED7100;verticalLabelPosition=bottom;verticalAlign=top;resIcon=mxgraph.aws4.kinesis_video_streams;strokeColor=#ffffff;" value="Video Metadata" vertex="1">
          <mxGeometry height="80" width="80" x="1374" y="5630" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-61" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-53" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-54">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-62" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-54" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-55" value="Play Event">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-63" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-55" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-56" value="Consume Stream">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-64" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-56" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-57" value="Batch &amp; Filter Bots">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-65" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-58" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-59" value="Extract Keyframe">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-66" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-59" style="edgeStyle=orthogonalEdgeStyle;" target="jUT0NAQbRsZXok18yd4u-60" value="Save Image URL">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-67" parent="1" style="text;html=1;whiteSpace=wrap;align=left;fillColor=#f5f5f5;strokeColor=#666666;spacing=15;fontSize=14;fontColor=#333333;" value="&lt;b style=&#39;font-size:16px;&#39;&gt;ISSUE:&lt;/b&gt;&lt;br&gt;The platform is now incredibly fast, stable, and scales perfectly. However, it lacks the core YouTube &#39;magic&#39;—the home page is just a generic, unpersonalized list of videos.&lt;br&gt;&lt;br&gt;&lt;b style=&#39;font-size:16px;&#39;&gt;SOLUTION:&lt;/b&gt;&lt;br&gt;Introduce a dedicated Feed / Recommendation Service powered by a User History Graph Database and a centralized User Service. These final components map user preferences to Video Metadata to populate the personalized homepage feed." vertex="1">
          <mxGeometry height="150" width="1090" x="410" y="5875" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-68" edge="1" parent="1" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" target="jUT0NAQbRsZXok18yd4u-132">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="140" y="6790" />
              <mxPoint x="140" y="7600" />
              <mxPoint x="1640" y="7600" />
              <mxPoint x="1640" y="6805" />
            </Array>
            <mxPoint x="150" y="6790" as="sourcePoint" />
            <mxPoint x="1595" y="6810" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-69" connectable="0" parent="jUT0NAQbRsZXok18yd4u-68" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" value="Direct Upload via Pre-Signed URL" vertex="1">
          <mxGeometry relative="1" x="-0.0111" y="5" as="geometry">
            <mxPoint y="-1" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-70" parent="1" style="shape=image;fillColor=#eeeeee;verticalLabelPosition=bottom;verticalAlign=top;labelBackgroundColor=default;aspect=fixed;perimeter=ellipsePerimeter;html=1;shadow=0;dashed=0;spacingTop=3;image=img/lib/active_directory/users.svg;" value="Clients (Web / Android / iOS)" vertex="1">
          <mxGeometry height="130" width="130" x="80" y="6450" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-71" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-73" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" target="jUT0NAQbRsZXok18yd4u-103">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="671" y="6575" />
              <mxPoint x="671" y="6560" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-72" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-73" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" target="jUT0NAQbRsZXok18yd4u-123">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="672" y="6575" />
              <mxPoint x="672" y="7295" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-73" parent="1" style="shape=mxgraph.aws4.endpoint;fillColor=#E7157B;verticalLabelPosition=bottom;verticalAlign=top;sketch=0;outlineConnect=0;fontColor=#232F3E;gradientColor=none;strokeColor=none;dashed=0;html=1;fontStyle=0;aspect=fixed;pointerEvents=1;" value="API Gateway + Load Balancer&#xa;Authentication&#xa;Authorization&#xa;Routing&#xa;Rate Limiting" vertex="1">
          <mxGeometry height="110" width="110" x="490" y="6520" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-74" parent="1" style="shape=mxgraph.gcp2.thumbs_up;fillColor=#3B8DF1;verticalLabelPosition=bottom;verticalAlign=top;sketch=0;html=1;aspect=fixed;strokeColor=none;shadow=0;labelPosition=center;" value="Like Service&#xa;Idempotent Writes" vertex="1">
          <mxGeometry height="100" width="100" x="746.88" y="6810" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-75" parent="1" style="shape=mxgraph.ios7.icons.message;fillColor=#dae8fc;verticalLabelPosition=bottom;verticalAlign=top;html=1;labelBackgroundColor=#ffffff;strokeWidth=2;strokeColor=#0080F0;shadow=0;dashed=0;" value="Comment Service&#xa;Pagination + Ranking" vertex="1">
          <mxGeometry height="100" width="100" x="740" y="6960" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-76" parent="1" style="shape=image;fillColor=#dae8fc;verticalLabelPosition=bottom;verticalAlign=top;labelBackgroundColor=default;aspect=fixed;html=1;points=[];image=img/lib/azure2/app_services/Search_Services.svg;" value="Search Service" vertex="1">
          <mxGeometry height="100" width="100" x="730" y="7120" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-77" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-78" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" target="jUT0NAQbRsZXok18yd4u-143">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1272" y="6410" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-78" parent="1" style="shape=image;fillColor=#d5e8d4;verticalLabelPosition=bottom;verticalAlign=top;labelBackgroundColor=default;aspect=fixed;perimeter=ellipsePerimeter;html=1;shadow=0;dashed=0;spacingTop=3;image=img/lib/active_directory/database_cube.svg;" value="Video Metadata DB&#xa;(Sharded SQL)" vertex="1">
          <mxGeometry height="100" width="100" x="1120" y="6360" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-79" parent="1" style="shape=mxgraph.aws3.elasticsearch_service;fillColor=#F58534;verticalLabelPosition=bottom;verticalAlign=top;outlineConnect=0;dashed=0;html=1;gradientColor=none;" value="ElasticSearch Cluster" vertex="1">
          <mxGeometry height="100" width="100" x="1100" y="7030" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-80" parent="1" style="shape=mxgraph.alibaba_cloud.oss_object_storage_service;fillColor=#FF6A00;verticalLabelPosition=bottom;verticalAlign=top;points=[];aspect=fixed;html=1;shadow=0;dashed=0;strokeColor=none;" value="Object Storage (Raw + Encoded)&lt;br&gt;&lt;b&gt;&lt;font style=&quot;font-size: 14px;&quot;&gt;HLS Segments&lt;br&gt;DASH Segments&lt;br&gt;Manifest Files&lt;/font&gt;&lt;/b&gt;" vertex="1">
          <mxGeometry height="100" width="100" x="1490" y="6550" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-81" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-84" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=1;entryY=0.5;entryDx=0;entryDy=0;" target="jUT0NAQbRsZXok18yd4u-78">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-82" connectable="0" parent="jUT0NAQbRsZXok18yd4u-81" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" value="&lt;span&gt;Update Status (Ready/Published)&lt;/span&gt;" vertex="1">
          <mxGeometry relative="1" x="-0.0155" y="2" as="geometry">
            <mxPoint x="-33" y="-453" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-83" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-84" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="1535" y="6910" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-84" parent="1" style="shape=mxgraph.alibaba_cloud.gts_global_transaction_service;fillColor=#FF6A00;verticalLabelPosition=bottom;verticalAlign=top;points=[];aspect=fixed;html=1;shadow=0;dashed=0;strokeColor=none;" value="Transcoding Workers&#xa;Auto Scaling&#xa;GPU Enabled" vertex="1">
          <mxGeometry height="110" width="110" x="1480" y="7213" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-85" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-86" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" target="jUT0NAQbRsZXok18yd4u-134">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="465" y="7560" />
              <mxPoint x="1349" y="7560" />
              <mxPoint x="1349" y="6830" />
            </Array>
            <mxPoint x="1480" y="6833" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-86" parent="1" style="shape=image;fillColor=#ffe6cc;verticalLabelPosition=bottom;verticalAlign=top;labelBackgroundColor=default;aspect=fixed;html=1;points=[];image=img/lib/azure2/app_services/CDN_Profiles.svg;" value="Global CDN&#xa;Edge Cache&#xa;Adaptive Bitrate Delivery" vertex="1">
          <mxGeometry height="100" width="100" x="415" y="6900" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-87" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-88" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" target="jUT0NAQbRsZXok18yd4u-110" value="">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-88" parent="1" style="shape=mxgraph.aws3.monitoring;fillColor=#759C3E;verticalLabelPosition=bottom;verticalAlign=top;outlineConnect=0;dashed=0;html=1;gradientColor=none;" value="Monitoring&#xa;Logging&#xa;Metrics&#xa;Alerting&#xa;Tracing" vertex="1">
          <mxGeometry height="100" width="100" x="1465" y="6320" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-89" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-70" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;" target="jUT0NAQbRsZXok18yd4u-102">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-90" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-121" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;" target="jUT0NAQbRsZXok18yd4u-80">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1440" y="6720" />
              <mxPoint x="1440" y="6600" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-91" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-80" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;" target="jUT0NAQbRsZXok18yd4u-132">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-92" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-132" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;" target="jUT0NAQbRsZXok18yd4u-84">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1640" y="6805" />
              <mxPoint x="1640" y="7120" />
              <mxPoint x="1535" y="7120" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-93" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-84" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;" target="jUT0NAQbRsZXok18yd4u-106">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1910" y="7120" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-94" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-106" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;" target="jUT0NAQbRsZXok18yd4u-80">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1440" y="6930" />
              <mxPoint x="1440" y="6600" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-95" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-70" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;" target="jUT0NAQbRsZXok18yd4u-86">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="140" y="6950" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-96" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-86" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;exitX=-0.05;exitY=0.55;exitDx=0;exitDy=0;exitPerimeter=0;entryX=1;entryY=0.5;entryDx=0;entryDy=0;entryPerimeter=0;" target="jUT0NAQbRsZXok18yd4u-132" value="Cache Miss">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="375" y="6955" />
              <mxPoint x="375" y="7580" />
              <mxPoint x="1985" y="7580" />
              <mxPoint x="1985" y="6810" />
              <mxPoint x="1814" y="6810" />
              <mxPoint x="1814" y="6805" />
            </Array>
            <mxPoint x="420" y="7160" as="sourcePoint" />
            <mxPoint x="1595" y="6810" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-97" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-74" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;" target="jUT0NAQbRsZXok18yd4u-136" value="Increment Counter">
          <mxGeometry relative="1" x="-0.3535" y="-4" as="geometry">
            <mxPoint as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-98" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-136" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;" target="jUT0NAQbRsZXok18yd4u-78" value="Async Batch Update">
          <mxGeometry relative="1" x="-0.0884" y="-13" as="geometry">
            <mxPoint as="offset" />
            <Array as="points">
              <mxPoint x="1150" y="6560" />
              <mxPoint x="1050" y="6560" />
              <mxPoint x="1050" y="6410" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-99" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-75" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;" target="jUT0NAQbRsZXok18yd4u-118">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-100" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-142" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;" target="jUT0NAQbRsZXok18yd4u-79">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-101" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-102" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" target="jUT0NAQbRsZXok18yd4u-73">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-102" parent="1" style="shape=mxgraph.aws3.traditional_server;fillColor=#7D7C7C;verticalLabelPosition=bottom;verticalAlign=top;outlineConnect=0;dashed=0;html=1;gradientColor=none;" value="WebSocket Gateway + LB&#xa;Persistent WS Connections&#xa;Rate Limiting" vertex="1">
          <mxGeometry height="100" width="100" x="330" y="6530" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-103" parent="1" style="shape=mxgraph.aws4.resourceIcon;fillColor=#ED7100;verticalLabelPosition=bottom;verticalAlign=top;sketch=0;points=[[0,0,0],[0.25,0,0],[0.5,0,0],[0.75,0,0],[1,0,0],[0,1,0],[0.25,1,0],[0.5,1,0],[0.75,1,0],[1,1,0],[0,0.25,0],[0,0.5,0],[0,0.75,0],[1,0.25,0],[1,0.5,0],[1,0.75,0]];outlineConnect=0;fontColor=#232F3E;strokeColor=#ffffff;dashed=0;html=1;fontStyle=0;aspect=fixed;resIcon=mxgraph.aws4.kinesis_video_streams;" value="Video Metadata Service" vertex="1">
          <mxGeometry height="100" width="100" x="740" y="6510" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-104" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-105" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" target="jUT0NAQbRsZXok18yd4u-73">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="545" y="6400" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-105" parent="1" style="shape=image;fillColor=#dae8fc;verticalLabelPosition=bottom;verticalAlign=top;labelBackgroundColor=default;aspect=fixed;html=1;points=[];image=img/lib/azure2/identity/Multi_Factor_Authentication.svg;" value="Auth Service (JWT Validation)" vertex="1">
          <mxGeometry height="100" width="100" x="740" y="6370" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-106" parent="1" style="shape=image;fillColor=#dae8fc;verticalLabelPosition=bottom;verticalAlign=top;labelBackgroundColor=default;sketch=0;aspect=fixed;html=1;points=[];image=img/lib/mscae/Bot_Services.svg;" value="&lt;b&gt;Generate Bitrates&lt;/b&gt;&lt;div&gt;&lt;b&gt;for Dynamic Bandwidth&lt;br&gt;1080p (5Mbps)&lt;br&gt;720p (3Mbps)&lt;br&gt;480p (1Mbps)&lt;br&gt;360p&lt;/b&gt;&lt;/div&gt;" vertex="1">
          <mxGeometry height="100" width="100" x="1860" y="6870" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-107" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-73" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.52;entryDx=0;entryDy=0;entryPerimeter=0;" target="jUT0NAQbRsZXok18yd4u-74">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="671" y="6575" />
              <mxPoint x="671" y="6860" />
              <mxPoint x="737" y="6860" />
              <mxPoint x="737" y="6862" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-108" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-73" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.003;entryY=0.553;entryDx=0;entryDy=0;entryPerimeter=0;" target="jUT0NAQbRsZXok18yd4u-75">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="672" y="6575" />
              <mxPoint x="672" y="7015" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-109" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-73" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.01;entryY=0.62;entryDx=0;entryDy=0;entryPerimeter=0;" target="jUT0NAQbRsZXok18yd4u-76">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="672" y="6575" />
              <mxPoint x="672" y="7182" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-110" parent="1" style="whiteSpace=wrap;html=1;verticalAlign=top;fillColor=#f5f5f5;dashed=0;fontColor=#333333;strokeColor=#666666;" value="&lt;div&gt;&lt;span style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;background-color: transparent; color: light-dark(rgb(0, 0, 0), rgb(255, 255, 255));&quot;&gt;FLOWS TO ALL NODES&lt;/span&gt;&lt;/div&gt;" vertex="1">
          <mxGeometry height="70" width="120" x="1635" y="6340" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-111" parent="1" style="image;html=1;image=img/lib/clip_art/computers/Database_128x128.png" value="USER DB" vertex="1">
          <mxGeometry height="80" width="80" x="1120" y="6250" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-112" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-73" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.003;entryY=0.28;entryDx=0;entryDy=0;entryPerimeter=0;" target="jUT0NAQbRsZXok18yd4u-105">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="672" y="6575" />
              <mxPoint x="672" y="6398" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-113" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-114" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" target="jUT0NAQbRsZXok18yd4u-111">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-114" parent="1" style="aspect=fixed;sketch=0;html=1;dashed=0;whitespace=wrap;verticalLabelPosition=bottom;verticalAlign=top;fillColor=#2875E2;strokeColor=#ffffff;points=[[0.005,0.63,0],[0.1,0.2,0],[0.9,0.2,0],[0.5,0,0],[0.995,0.63,0],[0.72,0.99,0],[0.5,1,0],[0.28,0.99,0]];shape=mxgraph.kubernetes.icon2;prIcon=user" value="User Service&lt;div&gt;&lt;br&gt;&lt;/div&gt;" vertex="1">
          <mxGeometry height="90" width="93.75" x="743.13" y="6220" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-115" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-73" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.005;entryY=0.63;entryDx=0;entryDy=0;entryPerimeter=0;" target="jUT0NAQbRsZXok18yd4u-114">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-116" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-121" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="280" y="6733" />
              <mxPoint x="280" y="6590" />
            </Array>
            <mxPoint x="310" y="6590" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-117" connectable="0" parent="jUT0NAQbRsZXok18yd4u-116" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" value="Subscribe to Events&lt;div&gt;Pub/Sub&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;" vertex="1">
          <mxGeometry relative="1" x="0.4762" y="-3" as="geometry">
            <mxPoint as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-118" parent="1" style="shape=image;fillColor=#d5e8d4;verticalLabelPosition=bottom;verticalAlign=top;labelBackgroundColor=default;html=1;image=img/lib/clip_art/computers/Database_128x128.png;" value="Comment DB&#xa;(NoSQL Cluster)" vertex="1">
          <mxGeometry height="100" width="100" x="1100" y="6850" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-119" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-121" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" target="jUT0NAQbRsZXok18yd4u-78">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="978" y="6720" />
              <mxPoint x="978" y="6410" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-120" connectable="0" parent="jUT0NAQbRsZXok18yd4u-119" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" value="Init VIdeo Record&lt;br&gt;(Status: Processing)" vertex="1">
          <mxGeometry relative="1" x="-0.0194" y="3" as="geometry">
            <mxPoint y="49" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-121" parent="1" style="shape=mxgraph.ios7.icons.share;fillColor=#dae8fc;verticalLabelPosition=bottom;verticalAlign=top;html=1;labelBackgroundColor=#ffffff;strokeWidth=2;strokeColor=#0080F0;shadow=0;dashed=0;" value="Upload Service&#xa;Pre-Signed URL Generation" vertex="1">
          <mxGeometry height="80" width="80" x="756.88" y="6680" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-122" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-123" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" target="jUT0NAQbRsZXok18yd4u-124">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-123" parent="1" style="image;aspect=fixed;perimeter=ellipsePerimeter;html=1;align=center;shadow=0;dashed=0;fontColor=#4277BB;labelBackgroundColor=default;fontSize=12;spacingTop=3;image=img/lib/ibm/infrastructure/event_feed.svg;" value="&lt;font style=&quot;color: rgb(0, 0, 0);&quot;&gt;Feed/ Recommendation Service&lt;/font&gt;" vertex="1">
          <mxGeometry height="90" width="90" x="735" y="7250" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-124" parent="1" style="image;html=1;image=img/lib/clip_art/computers/Database_128x128.png" value="User History / Graph DB" vertex="1">
          <mxGeometry height="120" width="90" x="1100" y="7190" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-125" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-127" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" target="jUT0NAQbRsZXok18yd4u-132">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="780" y="7526" />
              <mxPoint x="1745" y="7526" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-126" connectable="0" parent="jUT0NAQbRsZXok18yd4u-125" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" value="Periodic Sync&lt;div&gt;(Batch Update total views)&lt;/div&gt;" vertex="1">
          <mxGeometry relative="1" x="-0.0209" y="-1" as="geometry">
            <mxPoint x="1" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-127" parent="1" style="sketch=0;html=1;aspect=fixed;strokeColor=none;shadow=0;fillColor=#3B8DF1;verticalAlign=top;labelPosition=center;verticalLabelPosition=bottom;shape=mxgraph.gcp2.view_list" value="&lt;span style=&quot;background-color: light-dark(#ffffff, var(--ge-dark-color, #121212));&quot;&gt;View Service&lt;/span&gt;" vertex="1">
          <mxGeometry height="100" width="81" x="739.5" y="7390" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-128" parent="1" style="image;aspect=fixed;perimeter=ellipsePerimeter;html=1;align=center;shadow=0;dashed=0;spacingTop=3;image=img/lib/active_directory/database.svg;" value="View Database&lt;div&gt;Cassandra&lt;/div&gt;" vertex="1">
          <mxGeometry height="70" width="94.59" x="1080" y="7380" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-129" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-73" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.006;entryY=0.635;entryDx=0;entryDy=0;entryPerimeter=0;" target="jUT0NAQbRsZXok18yd4u-127">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="672" y="6575" />
              <mxPoint x="672" y="7454" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-130" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-131" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=1;entryY=0.5;entryDx=0;entryDy=0;" target="jUT0NAQbRsZXok18yd4u-128">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1349" y="7010" />
              <mxPoint x="1349" y="7415" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-131" parent="1" style="sketch=0;points=[[0,0,0],[0.25,0,0],[0.5,0,0],[0.75,0,0],[1,0,0],[0,1,0],[0.25,1,0],[0.5,1,0],[0.75,1,0],[1,1,0],[0,0.25,0],[0,0.5,0],[0,0.75,0],[1,0.25,0],[1,0.5,0],[1,0.75,0]];outlineConnect=0;fontColor=#232F3E;fillColor=#8C4FFF;strokeColor=#ffffff;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.managed_service_for_apache_flink;" value="&lt;span style=&quot;background-color: light-dark(#ffffff, var(--ge-dark-color, #121212));&quot;&gt;Stream Processor (Apache FLink)&lt;/span&gt;" vertex="1">
          <mxGeometry height="100" width="100" x="1690" y="6960" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-132" parent="1" style="shape=mxgraph.aws4.resourceIcon;fillColor=#8C4FFF;verticalLabelPosition=bottom;verticalAlign=top;aspect=fixed;html=1;shadow=0;dashed=0;strokeColor=#ffffff;sketch=0;points=[[0,0,0],[0.25,0,0],[0.5,0,0],[0.75,0,0],[1,0,0],[0,1,0],[0.25,1,0],[0.5,1,0],[0.75,1,0],[1,1,0],[0,0.25,0],[0,0.5,0],[0,0.75,0],[1,0.25,0],[1,0.5,0],[1,0.75,0]];outlineConnect=0;fontColor=#232F3E;fontStyle=0;resIcon=mxgraph.aws4.managed_streaming_for_kafka;" value="&lt;span style=&quot;background-color: light-dark(#ffffff, var(--ge-dark-color, #121212));&quot;&gt;Kafka / Streaming Queue&lt;br&gt;Upload Events&lt;br&gt;Like Events&lt;br&gt;Comment Events&lt;/span&gt;" vertex="1">
          <mxGeometry height="110" width="110" x="1690" y="6750" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-133" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-132" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;entryPerimeter=0;" target="jUT0NAQbRsZXok18yd4u-131">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1640" y="6805" />
              <mxPoint x="1640" y="7010" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-134" parent="1" style="points=[];aspect=fixed;html=1;align=center;shadow=0;dashed=0;fillColor=#FF6A00;strokeColor=none;shape=mxgraph.alibaba_cloud.imagesearch;" value="&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Thumbnail Storage&lt;/div&gt;" vertex="1">
          <mxGeometry height="100" width="100" x="1490" y="6780" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-135" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-134" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=1;entryY=0.5;entryDx=0;entryDy=0;entryPerimeter=0;" target="jUT0NAQbRsZXok18yd4u-103">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1151" y="6830" />
              <mxPoint x="1151" y="6560" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-136" parent="1" style="shape=image;fillColor=#d5e8d4;verticalLabelPosition=bottom;verticalAlign=top;labelBackgroundColor=default;sketch=0;aspect=fixed;html=1;points=[];image=img/lib/mscae/Cache_Redis_Product.svg;" value="Redis Cluster&#xa;Hot Like Counters&#xa;WS Registry" vertex="1">
          <mxGeometry height="100" width="100" x="1100" y="6670" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-137" parent="1" style="text;html=1;whiteSpace=wrap;align=center;fillColor=#dae8fc;strokeColor=#6c8ebf;spacing=15;fontSize=14;" value="&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;b&gt;FINAL DIAGRAM&lt;/b&gt;&lt;/span&gt;" vertex="1">
          <mxGeometry height="60" width="1090" x="480" y="6140" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-138" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-3" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=1;entryY=0.25;entryDx=0;entryDy=0;" target="jUT0NAQbRsZXok18yd4u-3">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-139" parent="1" style="text;whiteSpace=wrap;html=1;" value="&lt;p data-path-to-node=&quot;2&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;2&quot; data-index-in-node=&quot;0&quot; style=&quot;&quot;&gt;Experiment No:&amp;nbsp;&lt;/b&gt;6&lt;br&gt;&lt;b data-path-to-node=&quot;2&quot; data-index-in-node=&quot;31&quot; style=&quot;&quot;&gt;Name:&lt;/b&gt;&amp;nbsp;System Design of a Scalable Video Streaming Platform (YouTube Clone)&lt;/font&gt;&lt;/p&gt;&lt;p data-path-to-node=&quot;2&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/p&gt;&lt;h3 data-path-to-node=&quot;3&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;1. Functional Requirements&lt;/font&gt;&lt;/h3&gt;&lt;p data-path-to-node=&quot;4&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;These are the core features the system must provide to the end-user:&lt;/font&gt;&lt;/p&gt;&lt;ul data-path-to-node=&quot;5&quot;&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;5,0,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;5,0,0&quot; data-index-in-node=&quot;0&quot;&gt;User Account Management:&lt;/b&gt; Users can register, log in, and manage their profiles.&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;5,1,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;5,1,0&quot; data-index-in-node=&quot;0&quot;&gt;Video Uploading:&lt;/b&gt; Creators can upload large video files efficiently.&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;5,2,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;5,2,0&quot; data-index-in-node=&quot;0&quot;&gt;Video Streaming:&lt;/b&gt; Users can watch videos smoothly with Adaptive Bitrate Streaming (resolutions adjusting automatically based on network speed).&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;5,3,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;5,3,0&quot; data-index-in-node=&quot;0&quot;&gt;Social Interactions:&lt;/b&gt; Users can like, dislike, and comment on videos in real-time.&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;5,4,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;5,4,0&quot; data-index-in-node=&quot;0&quot;&gt;Search and Discovery:&lt;/b&gt; Users can search for videos by title or metadata.&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;5,5,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;5,5,0&quot; data-index-in-node=&quot;0&quot;&gt;Personalized Feed:&lt;/b&gt; Users receive a customized home page feed based on their watch history and interactions.&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;5,5,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;h3 data-path-to-node=&quot;6&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;2. Non-Functional Requirements&lt;/font&gt;&lt;/h3&gt;&lt;p data-path-to-node=&quot;7&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;These define how the system should perform under heavy load:&lt;/font&gt;&lt;/p&gt;&lt;ul data-path-to-node=&quot;8&quot;&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;8,0,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;8,0,0&quot; data-index-in-node=&quot;0&quot;&gt;High Availability:&lt;/b&gt; The system must remain accessible even during component failures (no single point of failure).&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;8,1,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;8,1,0&quot; data-index-in-node=&quot;0&quot;&gt;Low Latency:&lt;/b&gt; Video streaming must have minimal buffering, and the home page (thumbnails/metadata) must load in milliseconds.&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;8,2,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;8,2,0&quot; data-index-in-node=&quot;0&quot;&gt;High Throughput:&lt;/b&gt; The system must handle thousands of concurrent heavy video uploads and millions of simultaneous read requests (views).&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;8,3,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;8,3,0&quot; data-index-in-node=&quot;0&quot;&gt;Scalability:&lt;/b&gt; The architecture must horizontally scale out during peak traffic (e.g., auto-scaling transcoding workers, CDN caching).&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;8,4,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;8,4,0&quot; data-index-in-node=&quot;0&quot;&gt;Eventual Consistency:&lt;/b&gt; While video uploads must be strictly consistent (no data loss), social interactions (view counts, likes, comments) can be eventually consistent to optimize performance.&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;8,4,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;h3 data-path-to-node=&quot;9&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;3. Major Entities&lt;/font&gt;&lt;/h3&gt;&lt;p data-path-to-node=&quot;10&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;These are the core data models driving the microservices:&lt;/font&gt;&lt;/p&gt;&lt;ul data-path-to-node=&quot;11&quot;&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;11,0,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;11,0,0&quot; data-index-in-node=&quot;0&quot;&gt;User:&lt;/b&gt; &lt;code data-path-to-node=&quot;11,0,0&quot; data-index-in-node=&quot;6&quot;&gt;UserID&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,0,0&quot; data-index-in-node=&quot;14&quot;&gt;Username&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,0,0&quot; data-index-in-node=&quot;24&quot;&gt;Email&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,0,0&quot; data-index-in-node=&quot;31&quot;&gt;PasswordHash&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,0,0&quot; data-index-in-node=&quot;45&quot;&gt;ProfilePictureURL&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,0,0&quot; data-index-in-node=&quot;64&quot;&gt;CreatedAt&lt;/code&gt;&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;11,1,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;11,1,0&quot; data-index-in-node=&quot;0&quot;&gt;Video:&lt;/b&gt; &lt;code data-path-to-node=&quot;11,1,0&quot; data-index-in-node=&quot;7&quot;&gt;VideoID&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,1,0&quot; data-index-in-node=&quot;16&quot;&gt;UploaderID&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,1,0&quot; data-index-in-node=&quot;28&quot;&gt;Title&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,1,0&quot; data-index-in-node=&quot;35&quot;&gt;Description&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,1,0&quot; data-index-in-node=&quot;48&quot;&gt;RawS3Key&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,1,0&quot; data-index-in-node=&quot;58&quot;&gt;ManifestURL&lt;/code&gt; (for HLS/DASH), &lt;code data-path-to-node=&quot;11,1,0&quot; data-index-in-node=&quot;86&quot;&gt;ThumbnailURL&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,1,0&quot; data-index-in-node=&quot;100&quot;&gt;Status&lt;/code&gt; (Processing/Published), &lt;code data-path-to-node=&quot;11,1,0&quot; data-index-in-node=&quot;131&quot;&gt;TotalViews&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,1,0&quot; data-index-in-node=&quot;143&quot;&gt;CreatedAt&lt;/code&gt;&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;11,2,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;11,2,0&quot; data-index-in-node=&quot;0&quot;&gt;Interaction (Like/Dislike):&lt;/b&gt; &lt;code data-path-to-node=&quot;11,2,0&quot; data-index-in-node=&quot;28&quot;&gt;UserID&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,2,0&quot; data-index-in-node=&quot;36&quot;&gt;VideoID&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,2,0&quot; data-index-in-node=&quot;45&quot;&gt;InteractionType&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,2,0&quot; data-index-in-node=&quot;62&quot;&gt;Timestamp&lt;/code&gt;&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;11,3,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;11,3,0&quot; data-index-in-node=&quot;0&quot;&gt;Comment:&lt;/b&gt; &lt;code data-path-to-node=&quot;11,3,0&quot; data-index-in-node=&quot;9&quot;&gt;CommentID&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,3,0&quot; data-index-in-node=&quot;20&quot;&gt;VideoID&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,3,0&quot; data-index-in-node=&quot;29&quot;&gt;UserID&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,3,0&quot; data-index-in-node=&quot;37&quot;&gt;Text&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,3,0&quot; data-index-in-node=&quot;43&quot;&gt;Timestamp&lt;/code&gt;&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;11,4,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;b data-path-to-node=&quot;11,4,0&quot; data-index-in-node=&quot;0&quot;&gt;ViewHistory:&lt;/b&gt; &lt;code data-path-to-node=&quot;11,4,0&quot; data-index-in-node=&quot;13&quot;&gt;UserID&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,4,0&quot; data-index-in-node=&quot;21&quot;&gt;VideoID&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,4,0&quot; data-index-in-node=&quot;30&quot;&gt;WatchedDuration&lt;/code&gt;, &lt;code data-path-to-node=&quot;11,4,0&quot; data-index-in-node=&quot;47&quot;&gt;Timestamp&lt;/code&gt;&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;11,4,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;code data-path-to-node=&quot;11,4,0&quot; data-index-in-node=&quot;47&quot;&gt;&lt;br&gt;&lt;/code&gt;&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;h3 data-path-to-node=&quot;12&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;4. Core API Endpoints&lt;/font&gt;&lt;/h3&gt;&lt;p data-path-to-node=&quot;13&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;Exposed via the API Gateway to route requests to the respective microservices:&lt;/font&gt;&lt;/p&gt;&lt;ul data-path-to-node=&quot;14&quot;&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;14,0,0&quot;&gt;&lt;b data-path-to-node=&quot;14,0,0&quot; data-index-in-node=&quot;0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;Auth Service&lt;/font&gt;&lt;/b&gt;&lt;/p&gt;&lt;ul data-path-to-node=&quot;14,0,1&quot;&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;14,0,1,0,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;code data-path-to-node=&quot;14,0,1,0,0&quot; data-index-in-node=&quot;0&quot;&gt;POST /api/v1/auth/register&lt;/code&gt; - Create a new user.&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;14,0,1,1,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;code data-path-to-node=&quot;14,0,1,1,0&quot; data-index-in-node=&quot;0&quot;&gt;POST /api/v1/auth/login&lt;/code&gt; - Authenticate and return a JWT.&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;14,1,0&quot;&gt;&lt;b data-path-to-node=&quot;14,1,0&quot; data-index-in-node=&quot;0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;Upload Service&lt;/font&gt;&lt;/b&gt;&lt;/p&gt;&lt;ul data-path-to-node=&quot;14,1,1&quot;&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;14,1,1,0,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;code data-path-to-node=&quot;14,1,1,0,0&quot; data-index-in-node=&quot;0&quot;&gt;POST /api/v1/videos/upload/init&lt;/code&gt; - Initialize an upload and return an S3 Pre-Signed URL.&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;14,2,0&quot;&gt;&lt;b data-path-to-node=&quot;14,2,0&quot; data-index-in-node=&quot;0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;Video Metadata &amp;amp; Feed Service&lt;/font&gt;&lt;/b&gt;&lt;/p&gt;&lt;ul data-path-to-node=&quot;14,2,1&quot;&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;14,2,1,0,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;code data-path-to-node=&quot;14,2,1,0,0&quot; data-index-in-node=&quot;0&quot;&gt;GET /api/v1/videos/{video_id}&lt;/code&gt; - Fetch video metadata and streaming manifest URLs.&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;14,2,1,1,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;code data-path-to-node=&quot;14,2,1,1,0&quot; data-index-in-node=&quot;0&quot;&gt;GET /api/v1/feed&lt;/code&gt; - Fetch the personalized list of recommended videos for the home page.&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;14,3,0&quot;&gt;&lt;b data-path-to-node=&quot;14,3,0&quot; data-index-in-node=&quot;0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;Search Service&lt;/font&gt;&lt;/b&gt;&lt;/p&gt;&lt;ul data-path-to-node=&quot;14,3,1&quot;&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;14,3,1,0,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;code data-path-to-node=&quot;14,3,1,0,0&quot; data-index-in-node=&quot;0&quot;&gt;GET /api/v1/search?q={query}&amp;amp;page={page}&lt;/code&gt; - Query ElasticSearch for videos.&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;14,4,0&quot;&gt;&lt;b data-path-to-node=&quot;14,4,0&quot; data-index-in-node=&quot;0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;Interaction Services (Like &amp;amp; Comment)&lt;/font&gt;&lt;/b&gt;&lt;/p&gt;&lt;ul data-path-to-node=&quot;14,4,1&quot;&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;14,4,1,0,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;code data-path-to-node=&quot;14,4,1,0,0&quot; data-index-in-node=&quot;0&quot;&gt;POST /api/v1/videos/{video_id}/like&lt;/code&gt; - Increment like counter (updates Redis).&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;14,4,1,1,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;code data-path-to-node=&quot;14,4,1,1,0&quot; data-index-in-node=&quot;0&quot;&gt;POST /api/v1/videos/{video_id}/comments&lt;/code&gt; - Add a new comment (saves to NoSQL DB).&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p data-path-to-node=&quot;14,4,1,2,0&quot;&gt;&lt;font style=&quot;font-size: 32px;&quot;&gt;&lt;code data-path-to-node=&quot;14,4,1,2,0&quot; data-index-in-node=&quot;0&quot; style=&quot;&quot;&gt;GET /api/v1/videos/{video_id}/comments&lt;/code&gt; - Fetch paginated comments.&lt;/font&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;" vertex="1">
          <mxGeometry height="2710" width="1610" x="340" y="40" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-140" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-123" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;entryPerimeter=0;" target="jUT0NAQbRsZXok18yd4u-103">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="688" y="7295" />
              <mxPoint x="688" y="6560" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-141" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-76" style="edgeStyle=orthogonalEdgeStyle;endArrow=block;" target="jUT0NAQbRsZXok18yd4u-142" value="">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="830" y="7170" as="sourcePoint" />
            <mxPoint x="1100" y="7080" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-142" parent="1" style="whiteSpace=wrap;html=1;verticalAlign=top;fillColor=#dae8fc;labelBackgroundColor=default;" value="&lt;br&gt;CDC PIPELINE&lt;div&gt;&lt;br&gt;&lt;/div&gt;" vertex="1">
          <mxGeometry height="60" width="120" x="899" y="7104" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-143" parent="1" style="whiteSpace=wrap;html=1;verticalAlign=top;fillColor=#dae8fc;labelBackgroundColor=default;" value="&lt;br&gt;CDC PIPELINE&lt;div&gt;&lt;br&gt;&lt;/div&gt;" vertex="1">
          <mxGeometry height="60" width="120" x="1212" y="6550" as="geometry" />
        </mxCell>
        <mxCell id="jUT0NAQbRsZXok18yd4u-144" edge="1" parent="1" source="jUT0NAQbRsZXok18yd4u-143" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=1;entryY=0.5;entryDx=0;entryDy=0;entryPerimeter=0;" target="jUT0NAQbRsZXok18yd4u-79">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="1252" y="7080" />
            </Array>
          </mxGeometry>
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>