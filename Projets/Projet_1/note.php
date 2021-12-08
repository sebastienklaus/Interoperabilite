<?php


    $opts = array('http' => array('proxy'=> 'tcp://www-cache:3128', 'request_fulluri'=> true));
    $context = stream_context_create($opts);

    $xmltxt = file_get_contents('http://ip-api.com/xml', false, $context);



    // pour le proxy

    //a distance : on utilise pas load mais loadXML
    $doc = new DOMDocument();
    $doc->loadXML($xmltxt);
    echo $doc->saveXML();



    //velo : leaflet
?>