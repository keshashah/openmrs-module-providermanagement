<% ui.includeCss("providermanagement", "providerEdit.css") %>

<div class="content providerEdit">


    ${ ui.startForm("saveProvider", [personId: person.id]) }
        <table class="providerHeader">

            <!-- include the name fragment -->
            ${ ui.includeFragment("personName", [personName: person.personName, mode: 'edit']) }

            <tr>
                <td colspan="2"> ${ provider.providerRole?.name ?: '' }</td>
            </tr>
        </table>

        <table class="providerInfo">
            <tr>
                <th colspan="2">${ ui.message("providermanagement.general") }</th>
            </tr>

            <tr>
                <td><span class="label">${ ui.message("providermanagement.identifier") }:</span></td>
                <td><input type="text" id="provider.identifier" name="provider.identifier" size="20" value="${ provider.identifier ?: ''}"/></td>
            </tr>

            <tr>
                <td><span class="label">${ ui.message("Person.gender") }:</span></td>
                <td><input name="gender" type="radio" value="M" ${ person.gender == 'M' ? 'checked' : '' }> ${ ui.message("Person.gender.male") }
                    <input name="gender" type="radio" value="F" ${ person.gender == 'F' ? 'checked' : '' }> ${ ui.message("Person.gender.female") }</td>
            </tr>

            <tr>
                <td><span class="label">${ ui.message("Person.birthdate") }:</span></td>
                <td>${ ui.format(person.birthdate) }</td>
            </tr>

            <!-- TODO: add person attributes -->

            <!-- TODO: assumption here is that there is only one attribute of any type? -->
            <!-- TODO: change this so that it supports non-text attributes?? -->
            <% provider.providerRole?.providerAttributeTypes?.each { %>
            <tr>
                <td><span class="label">${ it.name }:</span></td>
                <td>${ provider.attributes.find{ attribute -> attribute.attributeType == it }?.value ?: '' }</td>
            </tr>
            <% } %>

            <tr>
                <th colspan="2">${ ui.message("Person.address") }</th>
            </tr>

            <!-- include the address fragment -->
            ${ ui.includeFragment("personAddress", [personAddress: person.personAddress, mode: 'edit']) }

        </table>


        <% if (config.actionButtons) { %>
        <table class="providerActionButtons">
            <tr>
                <td colspan="2">
                    ${ ui.includeFragment("widget/actionButtons", [actionButtons: config.actionButtons])}
                </td>
            </tr>
        </table>
        <% } %>
    ${ ui.endForm() }
</div>