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
