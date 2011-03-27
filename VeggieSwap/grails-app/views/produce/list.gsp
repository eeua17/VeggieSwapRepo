

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'produce.label', default: 'Produce')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'produce.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="type" title="${message(code: 'produce.type.label', default: 'Type')}" />
                        
                            <g:sortableColumn property="subtype" title="${message(code: 'produce.subtype.label', default: 'Subtype')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'produce.description.label', default: 'Description')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${produceInstanceList}" status="i" var="produceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${produceInstance.id}">${fieldValue(bean: produceInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: produceInstance, field: "type")}</td>
                        
                            <td>${fieldValue(bean: produceInstance, field: "subtype")}</td>
                        
                            <td>${fieldValue(bean: produceInstance, field: "description")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${produceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
