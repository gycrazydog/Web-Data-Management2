
    function showSummary() {
        var ss = document.getElementById("selectplay");
        var str = ss.options[ss.selectedIndex].text;
        if (str=="") {
            document.getElementById("left").innerHTML="please select a play!";
            return;
        } 
        $.ajax({
            type: 'post',
            url: 'getSummary.php',
            data: "q="+str,
            success: function (data) {
                $('#left').html(data);
                CollapsibleLists.applyTo(document.getElementById('left'));
            }
        });
    }
        function showContent(){
            var sc = document.getElementById("selectplay");
            var str = sc.options[sc.selectedIndex].text;
            if (str=="") {
            document.getElementById("left").innerHTML="please select a play!";
            return;
            } 
        $.ajax({
            type: 'post',
            url: 'getContent.php',
            data: "q="+str,
            success: function (data) {
                $('#left').html(data);
                CollapsibleLists.applyTo(document.getElementById("left"));
            }
        });
        }
        function showChar(str){
            if (str=="") {
            document.getElementById("right").innerHTML="please select a play!";
            return;
        } 
        $.ajax({
            type: 'post',
            url: 'getCha.php',
            data: "q="+str,
            success: function (data) {
                $('#right').html(data);
                CollapsibleLists.applyTo(document.getElementById("right"));
            }
        });
        }