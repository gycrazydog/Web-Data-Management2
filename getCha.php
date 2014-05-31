<?php
            include 'EXIST-API/Client.class.php';
            include 'EXIST-API/Query.class.php';
            include 'EXIST-API/ResultSet.class.php';
            include 'EXIST-API/SimpleXMLResultSet.class.php';
            include 'EXIST-API/DOMResultSet.class.php';
            $q = $_POST['q'];
            $names = explode(",", $q);
            $name = $names[0];
            ini_set('display_errors', '0');     # don't show any errors...
            error_reporting(E_ALL | E_STRICT);  # ...but do log them
            $connConfig = array(
                        'protocol'=>'http',
                        'host'=>'localhost',
                        'port'=>'8080',
                        'user'=>'admin',
                        'password'=>'admin',
                        'collection'=>'/exist'
                    );
                    $conn = new \ExistDB\Client($connConfig);
                    $path = "/db/Shakespeare/".$q.".xml";
                    $xql = <<<EOXQL
                            for \$m in collection("/db/Shakespeare/")//ACT
                            return <ACT>{\$m/TITLE}{
                                    for \$n in \$m//SCENE
                                    return<SCENE>{\$n/TITLE}{
                                        for \$s in \$n/SPEECH/LINE
                                        where \$n/SPEECH/SPEAKER=\$name
                                        return \$s
                                    }</SCENE>
                                    }
                                    </ACT>
EOXQL;
                    $stmt = $conn->prepareQuery($xql);
                    $stmt->bindVariable('name', $name);
                    $resultPool = $stmt->execute();
                    $results = $resultPool->getAllResults();
                    foreach ($results as $result) {
                        $doc = simplexml_load_string($result);       
                            $xsl = new DOMDocument();
                            $xsl->load("getLines.xsl");
                            $proc = new XSLTProcessor();
                            $proc->importStylesheet($xsl);
                            echo ($proc->transformToXml($doc));
                    }
?>
