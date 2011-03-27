


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'veggieUser.label', default: 'VeggieUser')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${veggieUserInstance}">
            <div class="errors">
                <g:renderErrors bean="${veggieUserInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fullName"><g:message code="veggieUser.fullName.label" default="Full Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'fullName', 'errors')}">
                                    <g:textField name="fullName" value="${veggieUserInstance?.fullName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userName"><g:message code="veggieUser.userName.label" default="User Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'userName', 'errors')}">
                                    <g:textField name="userName" value="${veggieUserInstance?.userName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="veggieUser.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${veggieUserInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="veggieUser.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'password', 'errors')}">
                                    <g:textField name="password" value="${veggieUserInstance?.password}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="aboutMe"><g:message code="veggieUser.aboutMe.label" default="About Me" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'aboutMe', 'errors')}">
                                    <g:textArea name="aboutMe" cols="40" rows="5" value="${veggieUserInstance?.aboutMe}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="website"><g:message code="veggieUser.website.label" default="Website" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'website', 'errors')}">
                                    <g:textField name="website" value="${veggieUserInstance?.website}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="postcode"><g:message code="veggieUser.postcode.label" default="Postcode" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: veggieUserInstance, field: 'postcode', 'errors')}">
                                    <g:textField name="postcode" value="${veggieUserInstance?.postcode}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
