
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/style.css">
    <title></title>
</head>
<body>
<form action="accept-claim.jsp">
    <h3>Сведения для заявки:</h3>
            <table border="1" width="6">
                <tbody>
                    <tr>
                        <td>Ваша фамилия, имя, отчество</td>
                        <td>
                            <input type="text" name="name, surname" />
                        </td>
                    </tr>
                    <tr>
                        <td>Контактный телефон</td>
                        <td>
                            <input type="text" name="telephone" />
                        </td>
                    </tr>
                    <tr>
                        <td>Корпус (связан с городком)</td>
                        <td>
                            <select name="buildings_list">
                                <option>Учебный корпус №1</option>
                                <option>Учебный корпус №2</option>
                                <option>Учебный корпус №3</option>
                                <option>Учебный корпус №4</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Кабинет</td>
                        <td>
                            <input type="text" name="room" />
                        </td>
                    </tr>
                    <tr>
                        <td>Тип и модель оборудования</td>
                        <td>
                            <input type="text" name="device_type" />
                        </td>
                    </tr>
                    <tr>
                        <td>Сервисный номер оборудования</td>
                        <td>
                            <input type="text" name="device_number" />
                        </td>
                    </tr>
                    <tr>
                        <td>Описание проблемы</td>
                        <td>
                            <textarea name="problem_description" rows="4" cols="30">
                            </textarea>
                        </td>
                    </tr>
                   <tr>
                        <td>Приоритет</td>
                        <td>
                            <select name="priority">
                                <option>Высокий</option>
                                <option>Средний</option>
                                <option>Низкий</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Дополнительный комментарий</td>
                        <td>
                            <textarea name="comment" rows="4" cols="30">
                            </textarea>
                        </td>
                    </tr>

                </tbody>
            </table>

            <input type="submit" value="Подтвердить" />
</form>
<%@include file="/parts/menu.jsp"%>
</body>
</html>