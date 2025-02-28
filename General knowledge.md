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
