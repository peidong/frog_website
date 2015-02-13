<?php
    session_start();

    if(!isset($_SESSION['username']))
    {
        header("Location: index.html");
        exit;
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Online Test: Frog</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- jQuery -->
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
  <script src="js/jquery-1.11.2.js"></script>

  <!-- Bootstrap -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/bootstrap.min.js"></script> 
  
  <!-- Code Mirror Script-->
  <link rel="stylesheet" href="codemirror/lib/codemirror.css">
  <link rel="stylesheet" href="codemirror/theme/frog.css">
  <script src="codemirror/lib/codemirror.js"></script>
  <script src="codemirror/mode/clike/clike.js"></script>

  <!-- jQuery File Upload -->
  <link href="plugins/jquery-upload-file-master/css/uploadfile.min.css" rel="stylesheet">
  <script src="plugins/jquery-upload-file-master/js/jquery.uploadfile.min.js"></script>

  <!-- Self-Built Script -->
  <script src="js/main.js"></script>
  <script src="js/utils.js"></script>

  <!-- Self-Built Style -->
  <style>
    div.scroll {
    height: 100px;
    overflow: scroll;
    }
  </style>

</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/index.html">Frog</a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li ><a href="/frog_test.php"> Source Code</a></li>
        <li><a href="#">Test Suites Generator</a></li>
        <li><a href="#">Fault Localization</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <?php 
        session_start();
        echo '<li><p class="navbar-text text-right">Welcome, <strong>'.$_SESSION['username'].'</strong>!</p></li>';
        ?> 
      </ul>
    </div>
  </div>
</nav>
<!-- End of Navigation Bar -->

<!-- Header -->
<a name="step1"/>
<div class="page-header">
  <h2 class="text-center">Frog Bug Finder <small>Testing Panel</small></h2>
</div>

<!-- Instructions -->
<div hidden class="row">
  <div class="col-md-12"> <div class="bg-warning">
			<p class="text-center text-warning"><strong>Instructions</strong>: Start with uploading/pasting source code! (Language support: c/c++)</p>
  </div></div>
</div>

<!-- ===========================================Testing Panel Body====================================================-->
<div class="container">
<a name="step2"/>

  <!-- Code Editor and Console --> 
  <div class="row">
    <!-- Code Editor -->    
    <div class="col-md-8" id="code-area">
      <div class="panel panel-success">
        <div class="panel-heading">Source Code Editor</div>
        <div class="panel-heading" id="file-uploader"><span class="glyphicon glyphicon-import" aria-hidden="true"></span>&nbsp Import Code</div>
        <div class="panel-body">
        <form >
          <textarea id="code" name="code"></textarea>
        </form>
        </div>
      </div>
    </div>  
    <!-- Console1 -->
    <div class="col-md-4" id="console-div1">
      <div class="panel panel-warning" >
      <div class="panel-heading">Testing Console</div>
      <div class="panel-body"><div class=scroll id="console1"></div></div>
      </div>
    </div>
  </div>
  <!-- End of Code Editore and Console -->

  <!-- Buttons -->
  <div class="row">
    <div id="extract-functions" class="col-md-4">
      <button type="button" id="extract-functions-button" data-loading-text="Extracting..." data-complete-text="finished!" class="btn btn-success" autocomplete="off">
      <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>  Extract Functions</button>
    </div>
  </div>
</div>
<!-- ===========================================Testing Result Body====================================================-->
<a name="step3"/>
  <!-- Function List--> 
  <div hidden class="container" id="function-list">
    <hr>
    <div class="row">
      <div class="col-md-8">
        <div  class="panel panel-info" >
            <div class="panel-heading">Function List</div>
            <div class="panel-body">
            <form id="function-list-form">
            <table class="table", id="function-list-table">
              <thead>
              <tr>
                <th>Function Name</th>
                <th>Selection</th>
              </tr>
              </thead>
            </table>
            </form>
            </div>
            </div>
      </div>
      <!-- Console2 -->
      <div hidden class="col-md-4" id="console-div2">
        <div class="panel panel-warning" >
        <div class="panel-heading">Testing Console</div>
        <div class="panel-body"><div class=scroll id="console2"></div></div>
        </div>
      </div>
    </div>
    <!-- Generate Test Suite -->
    <div class="row">
      <div class="col-md-8">
        <button type="button" id="generate-test-button" data-loading-text="Generating..." class="btn btn-success" autocomplete="off">
        <span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>  Generate Test Suite</button>
      </div>
    </div>
  </div>
  <!-- End of Function List--> 

  <!-- Test case list -->
  <div hidden id="test-suite" class="container">
    <hr>
    <div class="row">
    <div class="col-md-8">
      <div  class="panel panel-primary" >
          <div class="panel-heading">Test Suite Result</div>
          <div class="panel-body">
          <form id="test-suite-form">
          <table class="table", id="test-suite-table">
            <thead>
            <tr>
              <th>Test Cases</th><th>Output</th><th>Pass/Fail</th>
            </tr>
            </thead>
            <tr>
            <td>x=1, y=2, z=3; </td><td> 2 </td>
            <td>  <div class="btn-group" role="group" aria-label="...">
                  <button type="button" class="btn btn-info" disabled>Pass</button>
                  <button type="button" class="btn btn-warning">Fail </button></div></td>
            </tr>
          </table>
          </form>
          </div>
          </div>
    </div>
    <!-- Console3 -->
      <div hidden class="col-md-4" id="console-div3">
        <div class="panel panel-warning" >
        <div class="panel-heading">Testing Console</div>
        <div class="panel-body"><div class=scroll id="console3"></div></div>
        </div>
      </div>
    </div>
  </div>
  <!-- End of Test case list -->

</div>

<!-- Footer -->
<div class="container">
      <hr>
</div>
<footer>
<p class="text-center">Copyright © 2015 UCLA Design Automation Lab</p> 
</footer>
<!-- End of Footer -->

<script>
  /*
   * button function to extract function list
   */
  $('#extract-functions-button').on('click', function () {
    var $btn = $(this).button('loading');

    // Extract functions...
    extractFunctions();

    $btn.button('reset')
  });

  /*
   * button function to generate test cases
   */
  $('#generate-test-button').on('click', function () {
    var $btn = $(this).button('loading');

    // Get selected funciton id/ Instrument source code
    var radio = $('input[name="function_id"]:checked').val();
    createTestFile(radio);
    runKLEE(radio);

    $btn.button('reset');
  });
</script>

</body>
</html>
