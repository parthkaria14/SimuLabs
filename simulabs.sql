-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2023 at 05:17 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simulabs`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_code` varchar(20) NOT NULL,
  `course_name` varchar(75) NOT NULL,
  `department` varchar(75) NOT NULL,
  `semester` int(10) NOT NULL,
  `introduction` varchar(5000) NOT NULL,
  `objective` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_code`, `course_name`, `department`, `semester`, `introduction`, `objective`) VALUES
('DST198915', 'Data Structures', 'Information Technology', 3, 'To understand how various Data Structures work. To understand some important applications of various Data Structures. To familiarize how certain applications can benefit from the choice of Data Structures.', 'CO 1 - USE PRIMARY AND SECONDARY DATA STRUCTURES.\r\n<br>\r\nCO 2 - DESCRIBE LINEAR DATA STRUCTURES.\r\n<br>\r\nCO 3 - DESCRIBE NON-LINEAR DATA STRUCTURES.\r\n<br>\r\nCO 4 - IMPLEMENT SEARCHING AND SORTING TECHNIQUES.');

-- --------------------------------------------------------

--
-- Table structure for table `data_structures`
--

CREATE TABLE `data_structures` (
  `exp_no` int(25) NOT NULL,
  `title` varchar(250) NOT NULL,
  `aim` varchar(500) NOT NULL,
  `theory` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_structures`
--

INSERT INTO `data_structures` (`exp_no`, `title`, `aim`, `theory`) VALUES
(1, 'Stack', 'A program for pushing and popping an element into a STACK.', 'Stack is a linear data structure which follows a particular order in which the operations are performed. The order may be LIFO(Last In First Out) or FILO(First In Last Out).\r\n\r\nThere are many real-life examples of a stack. Consider an example of plates stacked over one another in the canteen. The plate which is at the top is the first one to be removed, i.e. the plate which has been placed at the bottommost position remains in the stack for the longest period of time. So, it can be simply seen to follow LIFO(Last In First Out)/FILO(First In Last Out).\r\n'),
(3, 'Circular Queue', 'A program for inserting and deleting an element in a Circular Queue.', 'A Circular Queue is an extended version of a normal queue where the last element of the queue is connected to the first element of the queue forming a circle.\r\nThe operations are performed based on FIFO (First In First Out) principle. It is also called ‘Ring Buffer’. \r\nIn a normal Queue, we can insert elements until queue becomes full. But once queue becomes full, we can not insert the next element even if there is a space in front of queue.\r\n'),
(6, 'Linked List', 'A program for various operations on a Linked List.', 'linked list is a sequence of data structures, which are connected together via links.\r\nLinked List is a sequence of links which contains items. Each link contains a connection to another link. Linked list is the second most-used data structure after array. Following are the important terms to understand the concept of Linked List.\r\n●	Link − Each link of a linked list can store a data called an element.\r\n●	Next − Each link of a linked list contains a link to the next link called Next.\r\n●	LinkedList − A Linked List contains the connection link to the first link called First.\r\nLinked List Representation\r\nLinked list can be visualized as a chain of nodes, where every node points to the next node.\r\n \r\nAs per the above illustration, following are the important points to be considered.\r\n●	Linked List contains a link element called first.\r\n●	Each link carries a data field(s) and a link field called next.\r\n●	Each link is linked with its next link using its next link.\r\n●	Last link carries a link as null to mark the end of the list.\r\nTypes of Linked List\r\nFollowing are the various types of linked list.\r\n●	Simple Linked List − Item navigation is forward only.\r\n●	Doubly Linked List − Items can be navigated forward and backward.\r\n●	Circular Linked List − Last item contains link of the first element as next and the first element has a link to the last element as previous.\r\nBasic Operations\r\nFollowing are the basic operations supported by a list.\r\n●	Insertion − Adds an element at the beginning of the list.\r\n●	Deletion − Deletes an element at the beginning of the list.\r\n●	Display − Displays the complete list.\r\n●	Search − Searches an element using the given key.\r\n●	Delete − Deletes an element using the given key.\r\n'),
(8, 'Binary Search', 'A program for Binary Search', 'Binary Search in Data Structure\r\nThere are various ways to search a particular element from a given list. One of them is Binary search.\r\nWhen there exists so much data everywhere, it is very necessary to have a good searching method to search for the particular data in lesser time.\r\nBinary search works faster than linear search. It is one of the fastest searching algorithms.\r\nWhat is Binary Search?\r\nIt is a searching technique. It is based upon Divide and conquer strategy. Binary search is applicable only on sorted data. It takes O(log n) time for completion.\r\nIt divides the given array into halves and then checks the middle element. If the middle element is smaller than the element to be searched, the algorithm selects the second half of the array and discards the first half.\r\nThus, at every step, the binary search algorithm keeps on discarding half of the array based on the value of the middle element. This process continues until the array becomes of the size 1 or 2 and the algorithm finally gets the required element.\r\nIf the search is successful i.e. the element is present in the array, it returns the index of that element. If the element is not present inside the array, the algorithm returns -1.\r\n'),
(9, 'Selection Sort', 'A program for Selection Sort.', 'Selection sort is a simple and efficient sorting algorithm that works by repeatedly selecting the smallest (or largest) element from the unsorted portion of the list and moving it to the sorted portion of the list. The algorithm repeatedly selects the smallest (or largest) element from the unsorted portion of the list and swaps it with the first element of the unsorted portion. This process is repeated for the remaining unsorted portion of the list until the entire list is sorted. One variation of selection sort is called “Bidirectional selection sort” which goes through the list of elements by alternating between the smallest and largest element, this way the algorithm can be faster in some cases.\r\nThe algorithm maintains two subarrays in a given array:\r\n- The subarray which already sorted. \r\n- The remaining subarray was unsorted.\r\nIn every iteration of the selection sort, the minimum element (considering ascending order) from the unsorted subarray is picked and moved to the beginning of the sorted subarray. \r\n\r\nAfter every iteration sorted subarray size increase by one and the unsorted subarray size decrease by one.'),
(10, 'Quick Sort', 'A program for Quick Sort.', 'QuickSort is a sorting algorithm based on the Divide and Conquer algorithm that picks an element as a pivot and partitions the given array around the picked pivot by placing the pivot in its correct position in the sorted array.\r\nThe key process in quickSort is a partition(). The target of partitions is to place the pivot (any element can be chosen to be a pivot) at its correct position in the sorted array and put all smaller elements to the left of the pivot, and all greater elements to the right of the pivot.\r\n\r\nThis partition is done recursively which finally sorts the array. See the below image for a better understanding.\r\n\r\nThere are many different choices for picking pivots. \r\n- Always pick the first element as a pivot.\r\n- Always pick the last element as a pivot (implemented below)\r\n- Pick a random element as a pivot.\r\n- Pick the middle as the pivot.'),
(11, 'Insertion Sort', 'A program for Insertion Sort.', 'Insertion sort is a simple sorting algorithm that works similar to the way you sort playing cards in your hands. The array is virtually split into a sorted and an unsorted part. Values from the unsorted part are picked and placed at the correct position in the sorted part.\r\n<br>\r\nCharacteristics of Insertion Sort:\r\n- This algorithm is one of the simplest algorithm with simple implementation.\r\n- Basically, Insertion sort is efficient for small data values.\r\n- Insertion sort is adaptive in nature, i.e. it is appropriate for data sets which are already partially sorted.'),
(12, 'Binary Tree', 'A  program to perform traversing of a Binary Tree.', 'Binary Tree is defined as a tree data structure where each node has at most 2 children. Since each element in a binary tree can have only 2 children, we typically name them the left and right child.\r\n<br>\r\nBinary Tree Representation:\r\nA Binary tree is represented by a pointer to the topmost node (commonly known as the “root”) of the tree. If the tree is empty, then the value of the root is NULL. Each node of a Binary Tree contains the following parts:\r\n- Data\r\n- Pointer to left child\r\n- Pointer to right child\r\n<br>\r\nBasic Operation On Binary Tree:\r\n- Inserting an element.\r\n- Removing an element.\r\n- Searching for an element.\r\n- Traversing the tree.'),
(13, 'Merge Sort', 'A program for Merge Sort.', 'Merge Sort is a Divide and Conquer algorithm. It divides the input array into two halves, calls itself for the two halves, and then merges the two sorted halves. The merge() function is used for merging two halves. The merge(arr, l, m, r) is a key process that assumes that arr[l..m] and arr[m+1..r] are sorted and merges the two sorted sub-arrays into one.\r\n'),
(111, 'demo', 'hehehehwwwqw', 'hehehehsssssHAA113');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `type` int(10) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `type`) VALUES
('admin', 'Admin@123', 1),
('test', 'Test@123', 2),
('user', 'User@123', 2),
('user2', 'User@123', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_code`);

--
-- Indexes for table `data_structures`
--
ALTER TABLE `data_structures`
  ADD PRIMARY KEY (`exp_no`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
