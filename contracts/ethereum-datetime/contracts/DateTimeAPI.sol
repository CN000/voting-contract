pragma solidity ^0.6.0;

abstract contract DateTimeAPI {
    /*
         *  Abstract contract for interfacing with the DateTime contract.
         *
     */
    function isLeapYear(uint16 year)    view public virtual returns (bool);
    function getYear(uint timestamp)    view public virtual returns (uint16);
    function getMonth(uint timestamp)   view public virtual returns (uint8);
    function getDay(uint timestamp)     view public virtual returns (uint8);
    function getHour(uint timestamp)    view public virtual returns (uint8);
    function getMinute(uint timestamp)  view public virtual returns (uint8);
    function getSecond(uint timestamp)  view public virtual  returns (uint8);
    function getWeekday(uint timestamp) view public virtual  returns (uint8);
    function toTimestamp(uint16 year, uint8 month, uint8 day) view public virtual returns (uint timestamp);
    function toTimestamp(uint16 year, uint8 month, uint8 day, uint8 hour) view public virtual returns (uint timestamp);
    function toTimestamp(uint16 year, uint8 month, uint8 day, uint8 hour, uint8 minute) view public virtual returns (uint timestamp);
    function toTimestamp(uint16 year, uint8 month, uint8 day, uint8 hour, uint8 minute, uint8 second) view public virtual returns (uint timestamp);
}
