

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'crop.label', default: 'Crop')}" />
        <title>All Crops</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>All Crops</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                           <th><g:message code="crop.grower.label" default="Grower" /></th>
                          
                           <th><g:message code="crop.produce.label" default="Produce" /></th>
                          
                          
                            <g:sortableColumn property="plantDate" title="${message(code: 'crop.plantDate.label', default: 'Plant Date')}" />
                            
                            <g:sortableColumn property="estYield" title="${message(code: 'crop.estYield.label', default: 'Estimate Yield')}" />
                        
                            <g:sortableColumn property="estHarvestDate" title="${message(code: 'crop.estHarvestDate.label', default: 'Estimate Harvest Date')}" />
                            
                                                 
                            <g:sortableColumn property="actHarvestDate" title="${message(code: 'crop.actHarvestDate.label', default: 'Actual Harvest Date')}" />
                        
                              <g:sortableColumn property="actYield" title="${message(code: 'crop.actYield.label', default: 'Actual Yield')}" />
                            
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cropInstanceList}" status="i" var="cropInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                           <td><g:link controller="veggieUser" action="show" id="${cropInstance?.grower?.id}">${cropInstance?.grower?.encodeAsHTML()}</g:link></td>
                            
                            <td><g:link action="show" id="${cropInstance.id}">${fieldValue(bean: cropInstance, field: "produce")}</g:link></td>
                        
                           
                          
                        
                            <td><g:formatDate format="dd MMM yyyy" date="${cropInstance.plantDate}" /></td>
                            
                             <td>${fieldValue(bean: cropInstance, field: "estYield")}</td>
                        
                            <td><g:formatDate format="dd MMM yyyy" date="${cropInstance.estHarvestDate}" /></td>
                            
                            <td><g:formatDate format="dd MMM yyyy" date="${cropInstance.actHarvestDate}" /></td>
                            
                            <td>${fieldValue(bean: cropInstance, field: "actYield")}</td>
                        
                           
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${cropInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
