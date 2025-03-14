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

## CÁC HÀM LIÊN QUAN ĐẾN XỬ LÝ THỜI GIAN TRONG SQL
### Lấy thời gian hiện tại
1. `NOW()`: Lấy timestamp hiện tại (bao gồm ngày, giờ, phút, giây, múi giờ)
2. `CURRENT_DATE`: Lấy ngày hiện tại (chỉ gồm năm, tháng, ngày)
3. `CURRENT_TIME`: Lấy giờ hiện tại (chỉ gồm giờ, phút, giây, múi giờ)
4. `CURRENT_TIMESTAMP`: Giống NOW(), lấy timestamp hiện tại
5. `LOCALTIMESTAMP`: Lấy timestamp hiện tại nhưng không có thông tin múi giờ
6. `LOCALTIME`: Lấy giờ hiện tại nhưng không có múi giờ
### Chuyển đổi và định dạng thời gian
1. `TO_CHAR(timestamp, format)`: Chuyển đổi timestamp sang chuỗi với định dạng mong muốn
2. `TO_TIMESTAMP(text, format)`: Chuyển đổi chuỗi thành timestamp
3. `TO_DATE(text, format)`: Chuyển đổi chuỗi thành date
### Trích xuất thông tin từ thời gian
1. `EXTRACT(field FROM timestamp)`: Lấy giá trị cụ thể từ timestamp (năm, tháng, ngày, giờ, phút, giây, tuần, quý,...)
2. `DATE_PART(field, timestamp)`: Giống EXTRACT, dùng để lấy phần cụ thể của timestamp
3. `DATE_TRUNC(field, timestamp)`: Làm tròn timestamp về một phần cụ thể (ngày, tháng, năm,...)
### Tính toán với thời gian
1. `AGE(timestamp1, timestamp2)`: Tính khoảng cách thời gian giữa hai timestamp
2. `JUSTIFY_DAYS(interval)`: Chuẩn hóa giá trị ngày trong khoảng thời gian
3. `JUSTIFY_HOURS(interval)`: Chuẩn hóa giá trị giờ trong khoảng thời gian
4. `JUSTIFY_INTERVAL(interval)`: Chuẩn hóa khoảng thời gian (cả ngày, giờ)
### Thao tác cộng/trừ thời gian
1. `timestamp + interval`: Cộng thêm khoảng thời gian vào timestamp
2. `timestamp - interval`: Trừ khoảng thời gian khỏi timestamp
3. `date + integer`: Cộng số ngày vào một ngày cụ thể
4. `date - integer`: Trừ số ngày khỏi một ngày cụ thể
5. `date - date`: Tính số ngày giữa hai ngày
### Tạo khoảng thời gian
1. `MAKE_INTERVAL(years, months, days, hours, mins, secs)`: Tạo khoảng thời gian từ các phần tử cụ thể
2. `MAKE_DATE(year, month, day)`: Tạo một giá trị DATE từ các thành phần số
3. `MAKE_TIME(hour, minute, second)`: Tạo một giá trị TIME từ các thành phần số
4. `MAKE_TIMESTAMP(year, month, day, hour, minute, second)`: Tạo một TIMESTAMP từ các thành phần số
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

Cụ thể, `GROUP BY 1` là cách viết ngắn gọn khi bạn muốn nhóm các kết quả dựa trên cột đầu tiên trong mệnh đề SELECT. Ví dụ:

```
SELECT column1, COUNT(*)
FROM your_table
GROUP BY 1;
```

Ở đây, GROUP BY 1 thực chất là viết tắt của GROUP BY column1

## STORED PROCEDURE
Stored Procedure là một thủ tục (phương thức), hay một tập hợp các câu lệnh SQL để thực hiện 1 nhiệm vụ nào đó

Trong Stored Procedure có 3 tham số chính là:

- `IN`: tham số đầu vào, ta sẽ truyền giá trị cho những tham số đó
- `OUT`: tham số đầu ra, nó sẽ nhận giá trị từ kết quả của phần body Stored Procedure
- `INOUT`: có tác dụng tham chiếu, nó có thể truyền giá trị cho Stored Procedure và cũng có thể lấy giá trị từ body Stored Procedure

### Cú pháp của Stored Procedure
```
CREATE OR REPLACE PROCEDURE procedure_name (parameter_list)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    --SQL statements;
END;
$$;
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
### AS `BODY` có nghĩa là gì khi khai báo trong Stored Procedure?
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

### Câu lệnh `DECLARE` trong Stored Procedure có tác dụng gì và ứng dụng như thế nào?
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
- `%`: tham số `giá trị` sẽ được thay vào vị trí này
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

## FUNCTION TRONG SQL
### Thông tin chung
Trong SQL, một function (hàm) là một khối mã có thể tái sử dụng, được dùng để thực hiện một nhiệm vụ cụ thể và trả về một giá trị đơn lẻ. Functions giúp bạn viết mã một cách hiệu quả hơn bằng cách gom các thao tác lặp đi lặp lại vào một chỗ duy nhất.

Có hai loại functions chính trong SQL:
- `Scalar Functions`: Trả về một giá trị duy nhất, có thể là số, chuỗi, hoặc bất kỳ kiểu dữ liệu nào khác. Ví dụ: `LEN()`, `ROUND()`, `GETDATE()`.
- `Table-Valued Functions`: Trả về một bảng kết quả, có thể được sử dụng như một bảng trong các câu truy vấn SQL khác.

Cú pháp
```
CREATE [OR REPLACE] FUNCTION function_name(
    param_name1 data_type [DEFAULT default_value],
    param_name2 data_type [DEFAULT default_value], 
    ...
) 
RETURNS return_type 
LANGUAGE plpgsql 
[STABLE | IMMUTABLE | VOLATILE]
[SECURITY DEFINER | SECURITY INVOKER]
AS $$
BEGIN
    -- Logic của function
    RETURN return_value;
END;
$$;
```
Giải thích các thành phần chính:

- `CREATE FUNCTION function_name`: Định nghĩa function, có thể thêm OR REPLACE để cập nhật nếu function đã tồn tại.
- `param_name data_type`: Danh sách tham số truyền vào.
- `DEFAULT default_value` (tuỳ chọn): Gán giá trị mặc định cho tham số.
- `RETURNS return_type`: Kiểu dữ liệu trả về của function.
- `LANGUAGE plpgsql`: Xác định ngôn ngữ lập trình (PL/pgSQL).
- `STABLE | IMMUTABLE | VOLATILE` (tuỳ chọn):
    - `IMMUTABLE`: Function luôn trả về kết quả giống nhau nếu đầu vào giống nhau.
    - `STABLE`: Không thay đổi dữ liệu nhưng có thể thay đổi theo phiên (session).
    - `VOLATILE`: Có thể thay đổi dữ liệu (mặc định).
- `SECURITY DEFINER | SECURITY INVOKER` (tuỳ chọn):
    - `SECURITY DEFINER`: Function chạy với quyền của người tạo.
    - `SECURITY INVOKER`: Function chạy với quyền của người gọi (mặc định).
 
Ví dụ
1. Function tính tổng giá trị đơn hàng
```
CREATE OR REPLACE FUNCTION GetTotalPrice(order_id INT) 
RETURNS DECIMAL(10,2)
LANGUAGE plpgsql 
STABLE
AS $$
DECLARE 
    total_price DECIMAL(10,2);
BEGIN
    SELECT SUM(price * quantity) INTO total_price FROM OrderDetails WHERE OrderID = order_id;
    RETURN total_price;
END;
$$;

--Gọi Function
SELECT GetTotalPrice(1);
```
3. Function kiểm tra số chẵn hay lẻ
```
CREATE FUNCTION IsEven(num INT) 
RETURNS BOOLEAN 
LANGUAGE plpgsql 
IMMUTABLE
AS $$
BEGIN
    RETURN num % 2 = 0;
END;
$$;

--Gọi Function
SELECT IsEven(10);  -- Trả về TRUE
SELECT IsEven(7);   -- Trả về FALSE
```
5. Function trả về nhiều dòng (Table Function)
```
CREATE FUNCTION GetOrdersByCustomer(customer_id INT)
RETURNS TABLE(order_id INT, order_date DATE, total_price DECIMAL)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT o.OrderID, o.OrderDate, SUM(od.price * od.quantity)
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.CustomerID = customer_id
    GROUP BY o.OrderID, o.OrderDate;
END;
$$;

--Gọi Function
SELECT * FROM GetOrdersByCustomer(5);
```
Tóm lại:
- Dùng RETURNS để xác định kiểu dữ liệu trả về (INT, DECIMAL, BOOLEAN, TABLE, v.v.).
- Dùng RETURN QUERY nếu function trả về nhiều dòng dữ liệu.
- Luôn khai báo LANGUAGE plpgsql khi viết function bằng PL/pgSQL.
### `Function` và `Procedure` khác nhau như thế nào?
Function:
- Dùng để tính toán và phải trả về 1 giá trị duy nhất (có thể là bảng)
- Hàm có thể được dùng trong các câu lệnh `SELECT`, `WHERE`, `HAVING`,...
- Hàm chỉ có thể nhận tham số `IN` đầu vào
- Hàm có thể được gọi từ Stored Procedure

Procedure:
- Dùng để thực hiện 1 loạt các thao tác, có thể trả về 1 hoặc nhiều giá trị
- Procedure có thể chứa cả các tham số `IN`, `OUT` hoặc `INOUT`
- Procedure không thể được gọi từ hàm
- Procedure không thể được sử dụng trong các câu lệnh `SELECT`, `WHERE`, `HAVING`,...

### Cách sử dụng `REFCURSOR` trong PostgreSQL
PostgreSQL có tồn tại kiểu dữ liệu REFCURSOR, và nó được sử dụng để trả về con trỏ (cursor) trỏ đến một tập kết quả của truy vấn. Kiểu dữ liệu này rất hữu ích khi bạn cần xử lý tập dữ liệu lớn từng phần thay vì lấy toàn bộ cùng một lúc.

Lưu ý khi sử dụng
- Cần chạy trong một transaction (BEGIN; ... COMMIT;) để con trỏ không bị mất. `REFCURSOR` chỉ hoạt động trong một phiên giao dịch (TRANSACTION), nếu phiên kết thúc mà con trỏ chưa đóng thì nó sẽ bị mất.
- Khi sử dụng REFCURSOR, bạn phải gọi `FETCH` hoặc `MOVE` để truy vấn dữ liệu từ con trỏ.
- Một function có thể trả về nhiều con trỏ bằng cách trả về kiểu SETOF REFCURSOR.

### Cách khai báo Refcursor
1. Cách khai báo REFCURSOR bằng `DECLARE` (biến cục bộ)
```
CREATE OR REPLACE FUNCTION GetOrdersCursor()
RETURNS REFCURSOR 
LANGUAGE plpgsql
AS $$
DECLARE
    order_cursor REFCURSOR;
BEGIN
    OPEN order_cursor FOR 
    SELECT OrderID, CustomerID, OrderDate FROM Orders;
    
    RETURN order_cursor;
END;
$$;
```
Cách gọi và lấy dữ liệu
```
BEGIN;
SELECT GetOrdersCursor() INTO my_cursor;
FETCH ALL FROM my_cursor;  -- Lấy dữ liệu từ con trỏ
CLOSE my_cursor;
COMMIT;
```
👉 Nhược điểm: `order_cursor` chỉ tồn tại trong function, không thể truyền từ bên ngoài vào.
2. Cách khai báo `REFCURSOR` trong tham số function
```
CREATE OR REPLACE FUNCTION GetOrdersCursor(ref_cursor REFCURSOR)
RETURNS REFCURSOR 
LANGUAGE plpgsql
AS $$
BEGIN
    OPEN ref_cursor FOR 
    SELECT OrderID, CustomerID, OrderDate FROM Orders;
    
    RETURN ref_cursor;
END;
$$;
```
Cách gọi và lấy dữ liệu
```
BEGIN;
DECLARE my_cursor REFCURSOR;  -- Khai báo con trỏ ngoài function
SELECT GetOrdersCursor('my_cursor');  -- Truyền con trỏ vào function
FETCH ALL FROM my_cursor;  -- Lấy dữ liệu từ con trỏ
CLOSE my_cursor;
COMMIT;
```
👉 Ưu điểm: `my_cursor` được truyền từ bên ngoài vào, giúp kiểm soát và tiếp tục sử dụng con trỏ sau khi function kết thúc.

Khi nào dùng cách nào?
- Dùng `DECLARE` trong function nếu chỉ cần sử dụng con trỏ bên trong function và không cần tiếp tục thao tác với nó bên ngoài.
- Dùng `REFCURSOR` làm tham số function nếu muốn truyền con trỏ từ bên ngoài vào và tiếp tục thao tác trên con trỏ sau khi function chạy xong.

## Ví dụ về việc sử dụng con trỏ bên ngoài function khi khai báo `Refcursor` trong tham số function
```
BEGIN;
-- 1️⃣ Khai báo con trỏ ngoài function
DECLARE my_cursor REFCURSOR;

-- 2️⃣ Gọi function để mở con trỏ
SELECT GetOrdersCursor('my_cursor');

-- 3️⃣ Tiếp tục sử dụng con trỏ để lấy dữ liệu dần dần
FETCH 1 FROM my_cursor;  -- Lấy 1 dòng đầu tiên
FETCH 3 FROM my_cursor;  -- Lấy thêm 3 dòng tiếp theo
FETCH ALL FROM my_cursor; -- Lấy tất cả dòng còn lại

-- 4️⃣ Đóng con trỏ sau khi sử dụng xong
CLOSE my_cursor;
COMMIT;
```
Đặc điểm của cách này
- Con trỏ my_cursor vẫn tồn tại bên ngoài function sau khi function kết thúc.
- Có thể sử dụng các lệnh như FETCH để lấy dữ liệu từng phần (thay vì lấy hết một lúc).
- Thích hợp để xử lý tập dữ liệu lớn mà không làm hệ thống bị quá tải. Điều này giúp lấy dữ liệu từng phần, tối ưu hiệu suất khi làm việc với tập dữ liệu lớn.
- Khi không cần dùng nữa, đừng quên CLOSE con trỏ để giải phóng tài nguyên.


# TRIGGER TRONG SQL
Trigger trong PostgreSQL là một cơ chế tự động thực thi một hàm (function) khi có một sự kiện (INSERT, UPDATE, DELETE) xảy ra trong cơ sở dữ liệu, một bảng (table) hoặc dạng xem (view).

Nó giúp đảm bảo tính toàn vẹn dữ liệu, kiểm tra điều kiện nghiệp vụ hoặc tự động hóa các tác vụ.

Trigger có thể hoạt động ở 2 cấp:
- Row-Leval Trigger: Kích hoạt cho từng dòng bị ảnh hưởng bởi câu lệnh SQL\
- Statement-Level Trigger: Kích hoạt một lần cho toàn bộ câu lệnh SQL (bất kể có bao nhiêu dòng bị ảnh hưởng)

Các sự kiện có thể kích hoạt trigger bao gồm:
- Insert
- Update
- Delete
- DDL (Data Defination Language)
- DML (Data Manipulation Language)

Các loại Trigger:
- Trigger Before (hoặc 'BEFORE INSERT', 'BEFORE UPDATE','BEFORE DELETE'): kích hoạt trước khi sự kiện xảy ra.

    Trigger BEFORE thường được sử dụng để kiểm tra hoặc can thiệp vào dữ liệu trước khi lệnh INSERT, UPDATE, DELETE được thực hiện hoặc để kiểm tra và thay đổi dữ liệu trước khi nó được cập nhật.

    Trigger BEFORE có khả năng ảnh hưởng đến dữ liệu trước hi nó được ghi nhận vào cơ sở dữ liệu. Ngoài ra nó còn được sử dụng để cản trở cập nhật dữ liệu nếu cần

    Ví dụ, kiểm tra giá trị dữ liệu trước khi thực hiện chèn bảng để đảm bảo tính hợp lệ
- Trigger After (hoặc 'AFTER INSERT', 'AFTER UPDATE','AFTER DELETE'): kích hoạt sau khi sự kiện xảy ra và dữ liệu đã được thay đổi trong cơ sở dữ liệu.

    Trigger AFTER thường được sử dụng để thực hiện các hành động sau khi dữ liệu đã được thay đổi. Trigger AFTER có thể truy cập vào dữ liệu đã được cập nhật và sử dụng nó trong các hành động khác

    Ví dụ, ghi log lại các thay đổi đã xảy ra trong bảng hoặc cập nhật các bảng liên quan
- Trigger INSTEAD OF là 1 loại khác của trigger trong SQL. Thường được sử dụng để thay đổi hoặc kiểm tra dữ liệu trước khi câu lệnh INSERT, UPDATE hay DELETE được thực hiển trên 1 view haocjw 1 bảng. Nó thay thế lệnh DML gốc bằng hành động bạn xác định trong trigger

  Cụ thể, trigger INSTEAD OF cho phép bạn thực hiện các hành động tùy chỉnh thay vì thực hiện lệnh DML gốc. Điều này có thể hữu ích khi bạn muốn kiểm tra hoặc can thiệp vào dữ liệu trước khi nó được ghi vào cơ sở dữ liệu hoặc bạn muốn thực hiện hành động không phải là lệnh DML trực tiếp.
  Ví dụ, nếu abnj có 1 view hoặc 1 bảng và bạn muốn áp dụng quy tắc kiểm tra trước khi cho phép các lệnh INSERT hoặc UPDATE, bạn có thể sử dụng trigger này để kiểm tra dữ liệu và thay đổi dữ liệu trước khi nó được ghi vào cơ sở dữ liệu.
  
Cú pháp

Bước 1: Tạo Trigger Function
```
CREATE OR REPLACE FUNCTION function_name()
RETURNS TRIGGER AS $$
BEGIN
    -- Logic xử lý
    RETURN NEW;  -- hoặc RETURN OLD;
END;
$$ LANGUAGE plpgsql;
```
- `NEW`: Chứa dữ liệu mới khi được thực hiện `INSSERT` hoặc `UPDATE`
- `OLD`: Chứa dữ liệu cũ khi thực hiện `UPDATE` hoặc `DELETE`

Bước 2: Tạo Trigger và liên kết với bảng
```
CREATE TRIGGER trigger_name
{ BEFORE | AFTER | INSTEAD OF } { INSERT | UPDATE | DELETE | TRUNCATE }
ON table_name
[ FOR EACH { ROW | STATEMENT } ]
[ WHEN (condition) ]
EXECUTE FUNCTION function_name();
```
## Khi tạo Trigger, việc khai báo `FOR EACH ROW` hoặc `FOR EACH STATEMENT` có sự khác biệt như thế nào?
Khi tạo trigger trong cơ sở dữ liệu, việc sử dụng FOR EACH ROW và FOR EACH STATEMENT quyết định cách trigger sẽ được thực thi

FOR EACH ROR
- Kích hoạt cho mỗi bản ghi (row): Trigger sẽ thực thi cho mỗi bản ghi bị ảnh hưởng bởi câu lệnh DML (INSERT, UPDATE, DELETE).

- Chi tiết và cụ thể: Thường được sử dụng khi bạn cần kiểm tra, thay đổi hoặc ghi nhận dữ liệu cho từng bản ghi riêng lẻ.

- Ví dụ: Khi bạn cập nhật 10 bản ghi trong bảng, trigger với `FOR EACH ROW` sẽ kích hoạt 10 lần, một lần cho mỗi bản ghi.

FOR EACH STATEMENT
- Kích hoạt cho mỗi câu lệnh (statement): Trigger sẽ thực thi một lần cho toàn bộ câu lệnh DML, bất kể câu lệnh đó ảnh hưởng đến bao nhiêu bản ghi.

- Hiệu suất cao hơn: Thường được sử dụng khi bạn cần thực hiện một tác vụ chỉ một lần cho toàn bộ câu lệnh, giúp tiết kiệm tài nguyên và thời gian.

- Ví dụ: Khi bạn cập nhật 10 bản ghi trong bảng, trigger với `FOR EACH STATEMENT` sẽ kích hoạt chỉ một lần cho toàn bộ câu lệnh cập nhật.

