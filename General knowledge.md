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
