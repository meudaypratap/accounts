<%@ page import="com.pg.accounts.Payment" %>

<g:set var="friends" value="${com.pg.accounts.User.loggedInUserFriends}"/>
<table class="table table-bordered">

    <tr>

        <td>
            <label for="paidBy">
                <g:message code="payment.paidBy.label" default="Paid By"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:select id="paidBy" name="paidBy.id" from="${friends}" optionKey="id" required="" value="${payment?.paidBy?.id}" class="many-to-one"/>
        </td>

    </tr>

    <tr>

        <td>
            <label for="receivedBy">
                <g:message code="payment.receivedBy.label" default="Received By"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:select id="receivedBy" name="receivedBy.id" from="${friends}" optionKey="id" required="" value="${payment?.receivedBy?.id}" class="many-to-one"/>
        </td>

    </tr>

    <tr>

        <td>
            <label for="amount">
                <g:message code="payment.amount.label" default="Amount"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:field name="amount" type="number" min="1" value="${payment.amount}" required=""/>
        </td>

    </tr>

    <tr>

        <td>
            <label for="paymentDate">
                <g:message code="payment.paymentDate.label" default="Payment Date"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:datePicker name="paymentDate" precision="day" value="${payment?.paymentDate}"/>
        </td>

    </tr>

</table>

