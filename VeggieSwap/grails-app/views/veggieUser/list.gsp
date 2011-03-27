

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'veggieUser.label', default: 'VeggieUser')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'veggieUser.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="fullName" title="${message(code: 'veggieUser.fullName.label', default: 'Full Name')}" />
                        
                            <g:sortableColumn property="userName" title="${message(code: 'veggieUser.userName.label', default: 'User Name')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'veggieUser.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="password" title="${message(code: 'veggieUser.password.label', default: 'Password')}" />
                        
                            <g:sortableColumn property="aboutMe" title="${message(code: 'veggieUser.aboutMe.label', default: 'About Me')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${veggieUserInstanceList}" status="i" var="veggieUserInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${veggieUserInstance.id}">${fieldValue(bean: veggieUserInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: veggieUserInstance, field: "fullName")}</td>
                        
                            <td>${fieldValue(bean: veggieUserInstance, field: "userName")}</td>
                        
                            <td>${fieldValue(bean: veggieUserInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: veggieUserInstance, field: "password")}</td>
                        
                            <td>${fieldValue(bean: veggieUserInstance, field: "aboutMe")}</td>
                        
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
