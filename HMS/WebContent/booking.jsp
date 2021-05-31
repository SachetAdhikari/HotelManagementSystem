<%@ include file="navbar.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book Now</title>
  </head>
  <body>
    <section class="main-page booking">
      <section class="book-main">
      <div class="book-main-div">
        <label for="">Hotel</label>
        <select name="Hotel" id="">
          <option value="Hotel-1">Hotel-1</option>
          <option value="Hotel-2">Hotel-2</option>
          <option value="Hotel-3">Hotel-3</option>
        </select>
      </div>
      <div class="book-main-div">
        <label for="room-type">Room Type</label>
        <form action="">
          <div>
            <input type="radio" id="AC" name="room-type">
            <label for="AC">AC</label>
          </div>
          <div>
            <input type="radio" id="Non-AC" name="room-type">
            <label for="Non-AC">Non-AC</label>
          </div>
        </form>
      </div>
      <div class="book-main-div">
        <label for="">Room Number</label>
        <select name="RoomNumber" id="">
          <option value="A1">A1</option>
          <option value="B2">B2</option>
          <option value="C3">C3</option>
        </select>
      </div>
      <div class="book-main-div">
        <label for="">No. of Guests</label>
        <select name="NoOfGuests" id="">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
        </select>
      </div>
      <div class="book-main-div">
        <label for="">Checkin Date </label>
        <input type="date" id="" name="CinDate" /><br />
      </div>
      <div class="book-main-div">
        <label for="">Checkout Date </label>
        <input type="date" id="" name="CoutDate" /><br />
      </div>
      </section>
      <section class="general-SBH">
        <h2>Quick Services</h2>
        <div>
          <div class="general-SBHbox addS1">
            <button>Add Service</button>
          </div>
          <div class="general-SBHbox addS2">
            <button>Add Service</button>
          </div>
          <div class="general-SBHbox addS3">
            <button>Add Service</button>
          </div>
        </div>
      </section>
        <input type="submit" class="button" value="Book Now" />
    </section>
  </body>
</html>
