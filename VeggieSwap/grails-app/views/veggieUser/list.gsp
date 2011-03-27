

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'veggieUser.label', default: 'VeggieUser')}" />
        <title>List of all Growers</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>List of all Growers</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="userName" title="${message(code: 'veggieUser.userName.label', default: 'User Name')}" />
                            <g:sortableColumn property="postcode" title="${message(code: 'veggieUser.postcode.label', default: 'Postcode')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${veggieUserInstanceList}" status="i" var="veggieUserInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${veggieUserInstance.id}">${fieldValue(bean: veggieUserInstance, field: 'userName')}</g:link></td>
                            <td>${fieldValue(bean: veggieUserInstance, field: "postcode")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${veggieUserInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
