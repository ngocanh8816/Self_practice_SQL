## CÁC HÀM LIÊN QUAN ĐẾN XỬ LÝ CHUỖI TRONG SQL
### Cơ bản
1. ```INITCAP(String)```: Chuyển chữ cái đầu tiên của mỗi từ trong chuỗi thành chữ hoa.

2. ```TRIM([leading | trailing | both] [characters] FROM string)```: Loại bỏ ký tự không mong muốn từ đầu hoặc cuối chuỗi.

3. ```SUBSTRING(string FROM start FOR length)```: Trích xuất một phần của chuỗi.

4. ```REPLACE(string, from_substring, to_substring)```: Thay thế một phần của chuỗi.

5. ```POSITION(substring IN string)```: Tìm vị trí của chuỗi con trong chuỗi chính.

6. ```LPAD(string, length, fill)```: Chèn thêm ký tự vào đầu chuỗi.

7. ```RPAD(string, length, fill)```: Chèn thêm ký tự vào cuối chuỗi.

### Nâng cao
1. ```STRING_AGG(expression, delimiter) [order_by_clause]```: Nối các giá trị của một cột thành một chuỗi, với dấu phân cách tùy ý.

2. ```REGEXP_MATCHES(string, pattern)```: Tìm các chuỗi con khớp với biểu thức chính quy.

3. ```REGEXP_REPLACE(string, pattern, replacement)```: Thay thế các chuỗi con khớp với biểu thức chính quy bằng chuỗi khác.

4. ```REGEXP_SPLIT_TO_ARRAY(string, pattern)```: Chia chuỗi thành một mảng các chuỗi con dựa trên biểu thức chính quy.

5. ```REGEXP_SPLIT_TO_TABLE(string, pattern)```: Chia chuỗi thành các hàng của bảng dựa trên biểu thức chính quy.

6. ```CONCAT_WS(separator, str1, str2, ...)```: Nối các chuỗi lại với nhau, có thêm ký tự phân cách.

### Ký tự đại diện trong SQL
1. ```%```: Đại diện cho số không hoặc nhiều ký tự.

    'bl%' sẽ có các kết quả như: bl, black, blue, blob.

2. ```_```: Đại diện cho một ký tự.

    'h_t' sẽ có các kết quả như: hot, hat, hit.

3. ```[]```: Đại diện cho bất kỳ ký tự nào trong dấu ngoặc.

    h[oa]t sẽ có các kết quả như: hot, hat nhưng không có hit.

4. ```[^]```: Đại diện cho bất kỳ ký tự nào không ở trong dấu ngoặc.

    h[^oa]t sẽ có các kết quả như: hit nhưng không có hot, hat.

5. ```-```: Đại diện cho một loạt các ký tự.

    c[a-b]t sẽ có các kết quả như: cat, cbt.

6. ```^```: Bắt đầu của chuỗi

7. ```$```: Kết thúc của chuỗi

8. ```.```: Bất kỳ ký tự nào

9. ```*```: 0 hoặc nhiều lần xuất hiện của ký tự trước đó

10. ```+```: 1 hoặc nhiều lần xuất hiện của ký tự trước đó

11. ```[a-z]```: Khớp với ký tự chữ cái (chữ thường)

12. ```[0-9]```: Khớp với ký tự chữ số (từ 0 đến 9)

13. ```[A-Z]```: Khớp với ký tự chữ cái (chữ hoa)

## BIỂU THỨC CHÍNH QUY (REGULAR EXPRESSION HAY REGEX) TRONG SQL
Biểu thức chính quy trong SQL là một công cụ mạnh mẽ để tìm kiếm, so khớp và thao tác chuỗi ký tự dựa trên các mẫu (patterns) xác định. Biểu thức chính quy cho phép bạn xác định các mẫu phức tạp và tìm kiếm các chuỗi phù hợp với các mẫu đó.

Trong PostgreSQL, biểu thức chính quy thường được sử dụng với toán tử ~ hoặc ~* (không phân biệt chữ hoa chữ thường)

Trong PostgreSQL, biểu tượng "~" thường được sử dụng trong các phép toán tìm kiếm mẫu theo kiểu biểu thức chính quy (regular expression). Các toán tử biểu thức chính quy trong PostgreSQL bao gồm:
1. `~`: Trả về true nếu chuỗi khớp với biểu thức chính quy.
2. `~*`: Trả về true nếu chuỗi khớp với biểu thức chính quy không phân biệt chữ hoa chữ thường.
3. `!~`: Trả về true nếu chuỗi không khớp với biểu thức chính quy.
4. `!~*`: Trả về true nếu chuỗi không khớp với biểu thức chính quy không phân biệt chữ hoa chữ thường.

### Nếu Regex không xác định ký tự `^` và `$` thì điều gì sẽ xảy ra?

Nếu biểu thức chính quy đó không có ký tự `^` và `$`, nó sẽ có ý nghĩa khác. Cụ thể, nó sẽ không yêu cầu bắt đầu và kết thúc của chuỗi phải khớp với mẫu regex, mà chỉ cần tìm một phần của chuỗi phù hợp với mẫu đó. Điều này có thể dẫn đến việc khớp nhiều kết quả hơn so với khi có ký tự `^` và `$`.

`^` và `$` yêu cầu toàn bộ chuỗi phải khớp với mẫu regex từ đầu đến cuối. Ví dụ, chuỗi `john.doe@leetcode.com` sẽ khớp, nhưng chuỗi `xyz john.doe@leetcode.com abc` sẽ không khớp vì có các ký tự không khớp trước và sau phần địa chỉ email.

Khi bỏ các ký tự `^` và `$`, `regex [a-zA-Z]+[a-zA-Z0-9_.-]*@leetcode\.com` sẽ khớp với bất kỳ phần nào của chuỗi mà phù hợp với mẫu. Ví dụ, chuỗi `xyz john.doe@leetcode.com abc` sẽ khớp vì nó chứa một phần phù hợp với mẫu email, ngay cả khi mẫu đó không bắt đầu và kết thúc của chuỗi.

Vì vậy, việc loại bỏ các ký tự `^` và `$` sẽ mở rộng phạm vi khớp, và có thể khiến các chuỗi chứa phần phù hợp nhưng không chính xác từ đầu đến cuối cũng được xem là khớp.

### Các ký tự `+`, `*` và `\` có các ý nghĩa gì trong biểu thức chính quy (Regex)?
Cụ thể trong biểu thức chính quy (regex):

1. Ký tự `+`:

    - Ý nghĩa: Khớp với một hoặc nhiều lần xuất hiện của ký tự hoặc nhóm ký tự trước đó.
    - Trong regex của bạn: `[a-zA-Z]+` khớp với một hoặc nhiều lần xuất hiện của các ký tự chữ cái (chữ hoa hoặc chữ thường). Điều này có nghĩa là nó yêu cầu ít nhất một ký tự chữ cái.
3. Ký tự `*`:

   - Ý nghĩa: Khớp với 0 hoặc nhiều lần xuất hiện của ký tự hoặc nhóm ký tự trước đó.
   - Trong regex của bạn: `[a-zA-Z0-9_.-]*` khớp với 0 hoặc nhiều lần xuất hiện của các ký tự chữ cái, chữ số, dấu chấm `(.)`, dấu gạch dưới `(_)`, hoặc dấu gạch ngang `(-)`. Điều này có nghĩa là phần này của email có thể không tồn tại hoặc có thể bao gồm nhiều ký tự trong tập hợp trên.
5. Ký tự `\`:

   - Ý nghĩa: Dùng để thoát ký tự đặc biệt trong regex, nghĩa là nó làm cho ký tự đặc biệt tiếp theo được hiểu theo nghĩa đen, không theo nghĩa đặc biệt của regex.
   - Trong regex của bạn: `@leetcode\.com` chứa `\.`, trong đó dấu chấm `(.)` được thoát để đảm bảo rằng nó được hiểu là dấu chấm thực sự trong email, không phải là ký tự đại diện cho bất kỳ ký tự nào khác trong regex.

## CÁC SYNTAX TRUY VẤN NHANH
Trong SQL, câu lệnh GROUP BY thường được sử dụng để nhóm các hàng có cùng giá trị trong một hoặc nhiều cột, từ đó có thể thực hiện các hàm tổng hợp như COUNT(), SUM(), AVG(), MIN(), MAX(),...

Cụ thể, GROUP BY 1 là cách viết ngắn gọn khi bạn muốn nhóm các kết quả dựa trên cột đầu tiên trong mệnh đề SELECT. Ví dụ:

```
SELECT column1, COUNT(*)
FROM your_table
GROUP BY 1;
```

Ở đây, GROUP BY 1 thực chất là viết tắt của GROUP BY column1

## STORED PROCEDURE
Stored Procedure là một thủ tục (phương thức), hay một tập hợp các câu lệnh SQL để thực hiện 1 nhiệm vụ nào đó

Trong Stored Procedure có 3 tham số chính là:

- IN: tham số đầu vào, ta sẽ truyền giá trị cho những tham số đó
- OUT: tham số đầu ra, nó sẽ nhận giá trị từ kết quả của phần body Stored Procedure
- INOUT: có tác dụng tham chiếu, nó có thể truyền giá trị cho Stored Procedure và cũng có thể lấy giá trị từ body Stored Procedure

### Cú pháp của Stored Procedure
```
CREATE OR REPLACE PROCEDURE procedure_name (parameter_list)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    --SQL statements
END
$$
```
`parameter_list`: danh sách các tham số đầu vào và đầu ra (nếu có) của Stored Procedure. Mỗi tham số được khai báo dưới dạng:
```
para_name data_type [IN | OUT | INOUT]
```
- `param_name`: tên của tham số
- `data_type`: kiểu dữ liệu của tham số
- `IN` (mặc định): chỉ định rằng tham số là đầu vào dùng để truyền giá trị từ người gọi váo thủ tục hoặc hàm. Giá trị của tham số này chỉ có thể đọc, không thể thay đổi trong quá trình thực thi.
- `OUT`: chỉ định rằng tham số là đầu ra. Được sử dụng để truyền giá trị từ thủ tục hoặc hàm ra người gọi. Biến đầu ra sẽ được gán giá trị trong quá trình thực thi của thủ tục hoặc hàm. Giá trị của tham số này có thể thay đổi trong quá trình thực thi và kết quả sẽ được trả về cho người gọi.
- `INOUT`: Tham số INOUT là sự kết hợp giữa tham số IN và OUT. Nó có thể nhận giá trị từ người gọi và giá trị này có thể thay đổi trong quá trình thực thi. Kết quả cuối cùng sẽ được trả về cho người gọi. Giá trị của tham số này có thể đọc và thay đổi trong quá trình thực thi, và giá trị cuối cùng sẽ được trả về cho người gọi.
- `LANGUAGE plpgsql`: chỉ định ngôn ngữ lập trình được sử dụng trong Stored Procudure. Trong trường hợp này, đó là PL/pgSQL, ngôn ngữ mở rộng của SQL trên PostgreSQL
- `AS $$ ...$$`: khung mã của Stored Procedure. Mọi câu lệnh PL/pgSQL được đặt trong khung này. Ký hiệu $$ được sử dụng để phân tách mã PL/pgSQL từ câu lệnh SQL bên ngoài
- `BEGIN...END`: thân của Stored Procedure, nơi bạn đặt các câu lệnh SQL và logic xử lý

Khi thực thi
```
CALL procedure_name(parameter_list);
```
Xóa Stored Procedure đã tạo
```
DROP PROCEDURE procedure_name (parameter_type) hoặc DROP PROCEDURE procedure_name (parameter_list);
```
- `procedure_name` là tên của Stored Procedure mà bạn muốn xóa.
- `parameter_types` là danh sách các kiểu dữ liệu của các tham số mà Stored Procedure đó sử dụng. Việc chỉ định các kiểu dữ liệu tham số là bắt buộc để xác định chính xác Stored Procedure bạn muốn xóa.
### AS $BODY$ có nghĩa là gì khi khai báo trong Stored Procedure?
Trong PostgreSQL, khi bạn thấy ký hiệu `AS $BODY$ ... $BODY$`, đây là cách để phân tách mã của Stored Procedure (hoặc Function) khỏi các câu lệnh SQL khác. BODY là một định danh có thể được chọn tùy ý, nhưng thường được sử dụng để chỉ ra rằng đoạn mã giữa các ký hiệu đó là nội dung chính của Procedure hoặc Function (ở đây chính là đoạn mã giữa `BEGIN` và `END`).

Cú pháp này cũng giống như sử dụng $$...$$ mà bạn đã thấy trước đây. Bạn có thể sử dụng bất kỳ tên nào thay thế BODY để bao quanh mã của bạn. Ví dụ:
```
CREATE OR REPLACE PROCEDURE example_procedure()
LANGUAGE plpgsql
AS $example$
BEGIN
    -- SQL statements
END;
$example$;
```
Trong ví dụ trên, `example` được sử dụng thay thế cho `BODY`, và các đoạn mã của Procedure được bao quanh bởi `$example$`.

### Câu lệnh DECLARE trong Stored Procedure có tác dụng gì và ứng dụng như thế nào?
Trong PostgreSQL, câu lệnh DECLARE thường được sử dụng trong các thủ tục lưu trữ (Stored Procedures) hoặc hàm (Functions) để khai báo các biến cục bộ. Các biến này có thể được sử dụng trong suốt quá trình thực thi của thủ tục hoặc hàm để lưu trữ và thao tác với dữ liệu tạm thời.

Cú pháp:
```
DECLARE
    variable_name data_type [DEFAULT value]
```
- Khai báo các biến cục bộ: cho phép tạo ra các biến mà bạn có thể sử dụng trong suốt quá trình thực thi thủ tục hoặc hàm
- Khởi tạo biến: bạn có thể gán giá trị mặc định cho biến ngay khi khai báo bằng cách sử dụng từ khóa `DEFAULT`

Ví dụ:
```
CREATE OR REPLACE PROCEDURE example_procedure()
LANGUAGE 'plpgsql'
AS $$
DECLARE
    -- Khai báo biến với giá trị mặc định
    total_salary NUMERIC DEFAULT 0; --hoặc total_salary NUMERIC := 0
    employee_count INT DEFAULT 100; --hoặc emplyee_count INT := 100
BEGIN
    -- Các câu lệnh SQL
    SELECT SUM(salary) INTO total_salary FROM employees;
    SELECT COUNT(*) INTO employee_count FROM employees;
    RAISE NOTICE 'Total salary: %', total_salary;
    RAISE NOTICE 'Employee count: %', employee_count;
END;
$$;
```
- `SELECT SUM(salary) INTO total_salary FROM employees`: Tính tổng số lương của tất cả nhân viên và gán kết quả vào biến `total_salary`
- `RAISE NOTICE 'Total salary: %', total_salary`: Hiển thị thông báo chứa giá trị của biến `total_salary`

### Lưu ý:
Cú pháp `INTO` được sử dụng trong câu lệnh SELECT để gán giá trị từ kết quả của truy vấn SQL vào biến. Tuy nhiên trong trường hợp bạn không thực hiện truy vấn `SELECT` mà chỉ đơn giản gán giá trị cho biến đầu ra thì việc sử dụng cú pháp `INTO` là chưa chính xác

Trong PL/pgSQL, để gán giá trị cho một biến, bạn sử dụng toán tử gán `:=` chứ không phải cú pháp `INTO`.

### Khối câu lệnh `Exception` trong Stored Procedure
Trong stored procedure, phần `EXCEPTION` được sử dụng để xử lý các lỗi và ngoại lệ xảy ra trong quá trình thực thi của Stored Procedure. Nó giúp đảm bảo rằng khi có lỗi xảy ra, bạn có thể bắt lỗi và thực hiện các hành động cần thiết thay vì để lỗi ảnh hưởng đến toàn bộ hệ thống.
```
CREATE OR REPLACE PROCEDURE update_employee_salary(
    emp_id INT,
    new_salary NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Cập nhật lương cho nhân viên
    UPDATE employees
    SET salary = new_salary
    WHERE id = emp_id;

    -- Nếu không có lỗi, kết thúc stored procedure
    RETURN;

EXCEPTION
    WHEN others THEN
        -- Bắt lỗi và hiển thị thông báo lỗi
        RAISE NOTICE 'Có lỗi xảy ra: %', SQLERRM;
        -- Có thể thêm các hành động khác ở đây nếu cần thiết
END;
$$;
```
- Phần `EXCEPTION...WHEN others THEN` được sử dụng để bắt tất cả các lỗi xảy ra trong quá trình thực thi
- `RAISE NOTICE 'Có lỗi xảy ra: %', SQLERRM;` là lệnh để hiển thị thông báo lỗi kèm theo thông điệp lỗi (`SQLERRM`)
Khi sử dụng phần `EXCEPTION`, bạn có thể đảm bảo rằng Stored Procedure của bạn sẽ không bị dừng lại đột ngột khi gặp lỗi và có thể xử lý lỗi một cách hợp lý.

## TỪ KHÓA `DO` TRONG POSTGRESQL
Trong PostgreSQL, từ khóa `DO` được sử dụng để thực hiện một khối lệnh PL/pgSQL mà không cần phải tạo một hàm lưu trữ (stored function). Điều này rất hữu ích cho các kịch bản mà bạn muốn thực hiện một khối lệnh đơn giản mà không cần lưu lại mã nguồn trong cơ sở dữ liệu. Bạn có thể dùng nó cho các tác vụ tạm thời hoặc kiểm thử mã nguồn.

Cú pháp:
```
DO $$
BEGIN
    -- Các lệnh PL/pgSQL tại đây
END $$;
```
Ví dụ:
```
DO $$
BEGIN
    -- Ví dụ đơn giản về việc chèn một bản ghi vào bảng employees
    INSERT INTO employees (name, position, salary)
    VALUES ('Jane Doe', 'Manager', 60000);

    -- Ví dụ về việc cập nhật lương của một nhân viên
    UPDATE employees
    SET salary = 65000
    WHERE name = 'John Doe';

    -- Hiển thị thông báo
    RAISE NOTICE 'Các lệnh đã được thực hiện thành công!';
END $$;
```
## HÀM `RAISE NOTICE` TRONG POSTGRESQL
Hàm `RAISE NOTIC`E trong PostgreSQL được sử dụng để hiển thị thông báo thông qua hệ thống nhật ký của PostgreSQL. Đây là cách bạn có thể ghi nhận các sự kiện, điểm dừng kiểm thử, hoặc thông báo xử lý trong stored procedure hoặc function, mà không dừng lại thực thi của chương trình.

Cú pháp của `RAISE NOTICE`:
```
RAISE NOTICE 'Thông báo: %', giá trị;
```
- `%`: tham số `giá trij` sẽ được thay vào vị trí này
Ví dụ:
```
CREATE OR REPLACE PROCEDURE update_employee_salary(
    emp_id INT,
    new_salary NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Cập nhật lương của nhân viên
    UPDATE employees
    SET salary = new_salary
    WHERE id = emp_id;

    -- Hiển thị thông báo khi cập nhật thành công
    RAISE NOTICE 'Đã cập nhật lương cho nhân viên có ID % với mức lương mới là %', emp_id, new_salary;
    
EXCEPTION
    WHEN others THEN
        -- Bắt lỗi và hiển thị thông báo lỗi
        RAISE NOTICE 'Có lỗi xảy ra: %', SQLERRM;
END;
$$;
```
- `RAISE NOTICE 'Đã cập nhật lương cho nhân viên có ID % với mức lương mới là %', emp_id, new_salary;`: Thông báo này sẽ hiển thị ID của nhân viên và mức lương mới sau khi cập nhật.
- `RAISE NOTICE 'Có lỗi xảy ra: %', SQLERRM;`: Thông báo này sẽ hiển thị thông điệp lỗi nếu có lỗi xảy ra.
## Các mức thông báo khác
- `RAISE DEBUG`: Sử dụng cho mục đích gỡ lỗi.
- `RAISE LOG`: Ghi nhật ký mà không hiển thị thông báo cho người dùng.
- `RAISE INFO`: Hiển thị thông tin bổ sung.
- `RAISE WARNING`: Hiển thị cảnh báo (không dừng quá trình thực thi).
- `RAISE EXCEPTION`: Ném ra một ngoại lệ và dừng quá trình thực thi.
