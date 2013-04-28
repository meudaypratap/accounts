<%@ page import="com.pg.accounts.Expense" %>



<table class="table table-bordered">

    <tr>

        <td>
            <label for="title">
                <g:message code="expense.title.label" default="Title"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:textField name="title" required="" value="${expense?.title}"/>
        </td>

    </tr>

    <tr>

        <td>
            <label for="amount">
                <g:message code="expense.amount.label" default="Amount"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:field name="amount" type="number" min="1" value="${expense.amount}" required=""/>
        </td>

    </tr>
     <g:set var="friends" value="${com.pg.accounts.User.loggedInUserFriends}"/>
    <tr>

        <td>
            <label for="paidBy">
                <g:message code="expense.paidBy.label" default="Paid By"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:select id="paidBy" name="paidBy.id" from="${friends}" optionKey="id" required="" value="${expense?.paidBy?.id}" class="many-to-one"/>
        </td>

    </tr>

    <tr>

        <td>
            <label for="users">
                <g:message code="expense.users.label" default="Users"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:select name="users" from="${friends}" multiple="multiple" optionKey="id" size="5" required="" value="${expense?.users*.id}"
                      class="many-to-many"/>
        </td>

    </tr>

    <tr>

        <td>
            <label for="expenseDate">
                <g:message code="expense.expenseDate.label" default="Expense Date"/>
                <span class="required-indicator">*</span>
            </label>
        </td>
        <td>
            <g:datePicker name="expenseDate" precision="day" value="${expense?.expenseDate}"/>
        </td>

    </tr>

</table>

