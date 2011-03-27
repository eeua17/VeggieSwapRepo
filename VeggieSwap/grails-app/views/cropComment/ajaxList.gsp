
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main" />

  <g:javascript library="prototype" />

  <title>Comments</title>
</head>
<body>

  <div class="nav">
    <span class="menuButton">
      <a class="home" href="${resource(dir:'')}">Home</a>
    </span>
    <span class="menuButton">
      <g:link class="create" action="create" 
              params='["crop.Id":"${crop?.id}"]'>New Comment
      </g:link>
    </span>
  </div>


  <div class="body">
    <h1>${crop?.grower} : ${crop?.produce} - Comments</h1>

    <div id="commentList">

      <g:messageThread comments="${cropCommentInstanceList}"/>
      

    </div>

    <br/>
    <h3>Comment Details</h3>
    <div id="details">
    </div>  
  </div>    

</body>
</html>
