//SPDX-License-Identifier:MIT;
pragma solidity ^0.8.0;




// 
/*
we are building a smart contract that enable us to 
1. store student information
2. retrieve strudent information
3. delete student information
4. creating an administrator that will handle delete,



*/


contract StudentDatabase{

    address Adiminstartor;
    uint count = 0;

    struct studentInfo{
        uint age;
        string name;
        string DOB;
        string teachersComment;

    }

    mapping(address =>studentInfo ) studentRecords;


    constructor (){
        Adiminstartor = msg.sender;
    }

    //store student information
    function storeStudentInformation(uint _age,string memory name,string memory _DOB, string memory _teachersComment,address _studentAddress
    ) public{
          require(msg.sender == Adiminstartor,"only administrator is allowed to call these function");
          studentInfo memory newStudent = studentInfo(_age,name,_DOB,_teachersComment);
          studentRecords[_studentAddress] = newStudent;
          
         

    } 


    //retrieve student information
    function retrieveStudentInfo(address _studentAddress)public virtual  returns(studentInfo memory){
        require(msg.sender == Adiminstartor,"only administrator is allowed to call these function");
        require(studentRecords[_studentAddress].age != 0, "student record has not been  addeed");

        return studentRecords[_studentAddress];
        
    }


    //delete student information
    function deleteStudentInformation(address _studentAddress)public {
        require(msg.sender == Adiminstartor,"only administrator is allowed to call these function");
         require(studentRecords[_studentAddress].age != 0, "student record has not been  addeed");

         delete studentRecords[_studentAddress];

    }




     




}
