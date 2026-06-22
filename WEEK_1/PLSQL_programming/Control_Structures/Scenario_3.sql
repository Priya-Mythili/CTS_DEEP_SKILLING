SET SERVEROUTPUT ON;

BEGIN
   FOR l IN (
      SELECT c.Name,
             l.LoanID,
             l.DueDate
      FROM Customers c, Loans l
      WHERE c.CustomerID = l.CustomerID
      AND l.DueDate BETWEEN SYSDATE AND SYSDATE+30
   )
   LOOP
      DBMS_OUTPUT.PUT_LINE(
         'Reminder: '
         || l.Name
         || ' Loan ID '
         || l.LoanID
         || ' Due Date '
         || l.DueDate
      );
   END LOOP;
END;
/