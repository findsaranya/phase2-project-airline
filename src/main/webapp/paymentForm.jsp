<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Details</title>
</head>
<body>
<h1>Payment Details</h1>
 <form  method="post" action="payment.jsp">
 <table>
 <tr>
 <td>Debit card Number</td>
 <td><input type="number" required name="cardno" min="1" maxlength="16"></td>
 </tr>
 <tr>
 <td>Expiry Date</td>
 <td><input type="text" required name="expiry"></td>
 </tr>
  <tr>
 <td>CVV</td>
 <td><input type="number" required min="1" maxlength="3"></td>
 </tr>
 <tr>
 <td colspan=2>
 <input type="submit" value="submit">
 </td>
 </tr>
 </table>
</form>

</body>
</html>