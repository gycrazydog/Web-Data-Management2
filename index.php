<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<?php session_start();?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>First</title>
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="util.js"></script>
        <script type="text/javascript" src="CollapsibleLists.js"></script>
        <link rel="stylesheet" type="text/css" href="style.css">
    <script>
      $(function () {
        $('form').bind('submit', function () {
          $.ajax({
            type: 'post',
            url: 'search.php',
            data: $('form').serialize(),
            success: function (data) {
              $('#result').html(data);
              alert(data);
            }
          });
          return false;
        });
      });
    </script>
     
    </head>
    <body bgcolor="#CCCCCC">
    <h2 style="font-family:verdana;color:#666666"align="center">Shakespeare Search Enginee</h2>
    <h3 style="font-family:verdana;color:#666666"align="center">Web application with PHP Exist API</h3>
        <hr>
        <h4 style="font-family:verdana;color:#666666" align="center">Please select a play:</h4>
        <form style="font-family:verdana;color:#666666" align="center">
            Play: <select id="selectplay" style="width: 200px;height: 25px;font-family:verdana;color:#666666;font-size:16px">
            <option> </option> 
            <option value="r_and_j">r_and_j</option>
            <option value="macbeth">macbeth</option>
            <option value="hamlet">hamlet</option>
            </select>
        <br><br><br>
<!--        <input type ="submit" style="width:120px;height:40px;font-size:20px;">-->
        <button class="action-button shadow animate blue"  id="show summary" onclick="showSummary()">Summary</button>
        <button class="action-button shadow animate red" id="show content" onclick="showContent()">Content List</button>
        </form>
        <div style="position:absolute;vertical-align:middle;text-align:center;">
            
        </div>
        <br><br><br>
        <hr>
        <div style="width:90%; margin:0 auto; overflow:auto; _display:inline-block;"> 
	<div id = "right" style="width:600px; float:right; background:#996699"></div> 
	<div id = "left" style=" margin-right:700px; background:#669999"></div> 
        </div> 

        
    </body>
</html>
