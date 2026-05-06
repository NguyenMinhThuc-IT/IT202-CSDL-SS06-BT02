CREATE DATABASE HotelManagement;
USE HotelManagement;

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_id INT,
    room_name VARCHAR(100),
    price_per_night DECIMAL(15, 2)
);

INSERT INTO Rooms (hotel_id, room_name, price_per_night) VALUES 
(1, 'Phòng Đơn Standard', 500000),
(1, 'Phòng Đôi Deluxe', 850000),
(1, 'Phòng Tổng Thống', 5000000),
(2, 'Phòng View Biển', 1200000),
(2, 'Phòng Gia Đình', 2000000),
(3, 'Phòng Dorm', 150000);

-- Code cũ 
SELECT hotel_id, room_name, MIN(price_per_night)
FROM Rooms
GROUP BY hotel_id;

/*
Lỗi này phát sinh do vi phạm quy tắc toán học và tính toàn vẹn dữ liệu trong phép gom nhóm:

Sự mâu thuẫn về số lượng dòng: Khi bạn GROUP BY hotel_id, Database sẽ nén nhiều dòng của cùng một khách sạn thành 01 dòng duy nhất cho mỗi ID.

Sự mờ đục của cột không gộp: Cột room_name không nằm trong mệnh đề GROUP BY và cũng không nằm trong một hàm gộp (như MIN, MAX, SUM).
*/

SELECT 
    hotel_id, 
    MIN(price_per_night) AS min_price
FROM Rooms
GROUP BY hotel_id;