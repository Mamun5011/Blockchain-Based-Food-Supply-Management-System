pragma solidity ^0.5.8;

contract mycontract
{
    
    struct Product{
        string ProductName;
        uint ProductPrice;
        uint ProductAmount;
        string CatagoryTypeID;
       
    }
    
    struct PersonProducer{
        string FirstName;
        string LastName;
        string PrivateKey;
        uint LandArea;
        uint cnt;
        mapping(address=>Product) ProducerProduct;
      
        
    }
    struct PersonWholesaler{
        string FirstName;
        string LastName;
        string PrivateKey;
        uint cnt;
        mapping(address=>Product) WholesalerProduct;
        
    }
    struct PersonRetailer{
        string FirstName;
        string LastName;
        string PrivateKey;
        uint cnt;
        mapping(address=>Product) RetailerProduct;
        
    }


    mapping(address=>PersonProducer) ProducersInfo;
    mapping(address=>PersonWholesaler) WholesalersInfo;
    mapping(address=>PersonRetailer) RetailersInfo;
    
    address Admin;
    
    constructor() public
    {
        Admin=msg.sender;
    }

    modifier OnlyAdmin
    {
        
        require(msg.sender==Admin);
        _;
        
    }
    
    function SetProducersInfo(
    string memory _firstname,
    string memory  _lastname,
    string memory  _privatekey,
    uint _LandArea,
    address Produceraddress //fingerprint divice->stirng->sha256(fingerprint)->address
    )
    OnlyAdmin public
    {
        ProducersInfo[Produceraddress].FirstName=_firstname;
        ProducersInfo[Produceraddress].LastName=_lastname;
        ProducersInfo[Produceraddress].PrivateKey=_privatekey;
        ProducersInfo[Produceraddress].LandArea=_LandArea;
        ProducersInfo[Produceraddress].cnt=0;
        
        
    }
    
    
    function SetWholesalersInfo(
    string memory  _firstname,
    string memory  _lastname,
    string memory  _privatekey,
    address Wholesaleraddress //fingerprint divice->stirng->sha256(fingerprint)->address
    )
    OnlyAdmin public
    {
        WholesalersInfo[Wholesaleraddress].FirstName=_firstname;
        WholesalersInfo[Wholesaleraddress].LastName=_lastname;
        WholesalersInfo[Wholesaleraddress].PrivateKey=_privatekey;
        WholesalersInfo[Wholesaleraddress].cnt=0;
     
        
    }
    
    
    function SetRetailersInfo(
    string memory  _firstname,
    string memory  _lastname,
    string memory  _privatekey,
   
    address Retaileraddress //fingerprint divice->stirng->sha256(fingerprint)->address
    )
    OnlyAdmin public
    {
        RetailersInfo[Retaileraddress].FirstName=_firstname;
        RetailersInfo[Retaileraddress].LastName=_lastname;
        RetailersInfo[Retaileraddress].PrivateKey=_privatekey;
        RetailersInfo[Retaileraddress].cnt=0;
    
    }
    
    function IncreaseProducerProduct(
        string memory _ProductName,
        uint _productPrice,
        uint _ProductAmount,
        string memory _CatagoryTypeID,
        address Productaddress,
        address Produceraddress
      
        )OnlyAdmin public{
            if(ProducersInfo[Produceraddress].ProducerProduct[Productaddress].ProductAmount==0)
            {
                ProducersInfo[Produceraddress].ProducerProduct
                [Productaddress].ProductName=_ProductName;
                ProducersInfo[Produceraddress].ProducerProduct
                [Productaddress].ProductPrice=_productPrice;
                ProducersInfo[Produceraddress].ProducerProduct
                [Productaddress].ProductAmount=_ProductAmount;
                ProducersInfo[Produceraddress].ProducerProduct
                [Productaddress].CatagoryTypeID=_CatagoryTypeID;
                
                ProducersInfo[Produceraddress].cnt++;
                
            }
            else
            {
                ProducersInfo[Produceraddress].ProducerProduct[Productaddress].ProductAmount+=_ProductAmount;
            }
        }
    
    
    function ReduceProducerProduct(
      
        uint _ProductAmount,
        address Productaddress,
        address Produceraddress
        )OnlyAdmin internal{
            ProducersInfo[Produceraddress].ProducerProduct[Productaddress].ProductAmount-=_ProductAmount;
            if(ProducersInfo[Produceraddress].ProducerProduct[Productaddress].ProductAmount==0)
            {
                delete ProducersInfo[Produceraddress].ProducerProduct[Productaddress];
                ProducersInfo[Produceraddress].cnt--;
            }
            
        }
    function IncreaseWholesalerProduct(
        string memory _ProductName,
        uint _productPrice,
        uint _ProductAmount,
        string memory _CatagoryTypeID,
        address Productaddress,
        address Wholesaleraddress
      
        )OnlyAdmin internal{
            if(WholesalersInfo[Wholesaleraddress].WholesalerProduct[Productaddress].ProductAmount==0)
            {
                WholesalersInfo[Wholesaleraddress].WholesalerProduct[Productaddress].ProductName=_ProductName;
                WholesalersInfo[Wholesaleraddress].WholesalerProduct[Productaddress].ProductPrice=_productPrice;
                WholesalersInfo[Wholesaleraddress].WholesalerProduct[Productaddress].ProductAmount=_ProductAmount;
                WholesalersInfo[Wholesaleraddress].WholesalerProduct[Productaddress].CatagoryTypeID=_CatagoryTypeID;
                WholesalersInfo[Wholesaleraddress].cnt++;
            }
            else
            {
                WholesalersInfo[Wholesaleraddress].WholesalerProduct[Productaddress].ProductAmount+=_ProductAmount;
            }
        }
        
        function ReduceWholesalerProduct (
        uint _ProductAmount,
        address Productaddress,
        address Wholesaleraddress
        )OnlyAdmin internal{
            WholesalersInfo[Wholesaleraddress].WholesalerProduct[Productaddress].ProductAmount-=_ProductAmount;
            if(WholesalersInfo[Wholesaleraddress].WholesalerProduct[Productaddress].ProductAmount==0)
            {
                delete WholesalersInfo[Wholesaleraddress].WholesalerProduct[Productaddress];
                WholesalersInfo[Wholesaleraddress].cnt--;
            }
            
        }

    function IncreaseRetailerProduct(
        string memory _ProductName,
        uint _productPrice,
        uint _ProductAmount,
        string memory _CatagoryTypeID,
        address Productaddress,
        address Retaileraddress
      
        )OnlyAdmin internal{
            if(RetailersInfo[Retaileraddress].RetailerProduct[Productaddress].ProductAmount==0)
            {
                RetailersInfo[Retaileraddress].RetailerProduct[Productaddress].ProductName=_ProductName;
                RetailersInfo[Retaileraddress].RetailerProduct[Productaddress].ProductPrice=_productPrice;
                RetailersInfo[Retaileraddress].RetailerProduct[Productaddress].ProductAmount=_ProductAmount;
                RetailersInfo[Retaileraddress].RetailerProduct[Productaddress].CatagoryTypeID=_CatagoryTypeID;
                RetailersInfo[Retaileraddress].cnt++;
            }
            else
            {
                RetailersInfo[Retaileraddress].RetailerProduct[Productaddress].ProductAmount+=_ProductAmount;
            }
        }
        
    
   
    
    function ProducerToWholesaler(
        string memory _ProductName,
        uint _productPrice,
        uint _ProductAmount,
        string memory _CatagoryTypeID,
        address Productaddress,
        address Produceraddress,
        address Wholesaleraddress
        
        )OnlyAdmin public{
            
            ReduceProducerProduct(
             
            _ProductAmount,
            
            Productaddress,
            Produceraddress );
            
            IncreaseWholesalerProduct(_ProductName, 
            _productPrice, 
            _ProductAmount,
            _CatagoryTypeID,
            Productaddress,
            Wholesaleraddress );
        }
        
        
        
    function WholesalerToRetailer(
        string memory _ProductName,
        uint _productPrice,
        uint _ProductAmount,
        string memory _CatagoryTypeID,
        address Productaddress,
        address Wholesaleraddress,
        address Retaileraddress
        
        )OnlyAdmin public{
            
            
            ReduceWholesalerProduct(
            
            _ProductAmount,
            
            Productaddress,
            Wholesaleraddress );
            
            IncreaseRetailerProduct(_ProductName, 
            _productPrice, 
            _ProductAmount,
            _CatagoryTypeID,
            Productaddress,
            Retaileraddress );
        }
    
    
    
    function getProducerInfo(
        address _Producersaddress
        ) OnlyAdmin view public returns(
            string memory,
            string memory,
            string memory,
            uint,
            uint){
                return(ProducersInfo[_Producersaddress].FirstName,
                ProducersInfo[_Producersaddress].LastName,
                ProducersInfo[_Producersaddress].PrivateKey,
                ProducersInfo[_Producersaddress].LandArea,
                ProducersInfo[_Producersaddress].cnt
                
                
                );
            }
            
           
   function getWholesalersInfo(
        address _Wholesalersaddress
        ) OnlyAdmin view public returns(
            string memory,
            string memory,
            string memory,
            uint
            
             ){
                return(WholesalersInfo[_Wholesalersaddress].FirstName,
                WholesalersInfo[_Wholesalersaddress].LastName,
                WholesalersInfo[_Wholesalersaddress].PrivateKey,
                WholesalersInfo[_Wholesalersaddress].cnt
               
               
                
                );
             }
            
       
    
    function getRetailersInfo(
        address _Retailersaddress
        ) OnlyAdmin view public returns(
            string memory,
            string memory,
            string memory,
            uint
             ){
                return(RetailersInfo[_Retailersaddress].FirstName,
                RetailersInfo[_Retailersaddress].LastName,
                RetailersInfo[_Retailersaddress].PrivateKey,
                RetailersInfo[_Retailersaddress].cnt
                );
            }
            
            
            

}