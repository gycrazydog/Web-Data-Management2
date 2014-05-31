<?php
            include 'EXIST-API/Client.class.php';
            include 'EXIST-API/Query.class.php';
            include 'EXIST-API/ResultSet.class.php';
            include 'EXIST-API/SimpleXMLResultSet.class.php';
            include 'EXIST-API/DOMResultSet.class.php';
    $q = $_POST['q'];
    $a = $_POST['a'];
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
                                for \$m in doc(\$path)//ACT
                                    where \$m/TITLE=\$act
                                    return \$m/SCENE/TITLE/text()
EOXQL;
                    $stmt = $conn->prepareQuery($xql);
                    $stmt->bindVariable('path', $path);
                    $stmt->bindVariable('act', $a);
                    $resultPool = $stmt->execute();
                    $results = $resultPool->getAllResults();
//                    echo $results;
                    foreach ($results as $result) {
                        echo $result."+";
                    }
?>
