import { React, useState } from 'react';
import './DatePicker.css';
import { YearPicker, MonthPicker, DayPicker } from 'react-dropdown-date';

function DatePicker() {
  const [dateOfBirth, setDateOfBirth] = useState({
    day: '',
    month: '',
    year: '',
  });
  const today = new Date();
  const endYear = today.getFullYear();
  const startYear = endYear - 120;
  return (
    <div>
      <div className="date">
        <div className="month-container">
          <label className="year-label" htmlFor="month">
            {' '}
            Month
          </label>
          <MonthPicker
            defaultValue=" "
            endYearGiven // mandatory if end={} is given in YearPicker
            year={dateOfBirth.year} // mandatory
            required // default is false
            value={dateOfBirth.month} // mandatory
            onChange={(month) => {
            // mandatory
              setDateOfBirth((date) => ({ ...date, month }));
            }}
            id="month"
            name="month"
            classes="menu"
            optionClasses="option class"
          />
        </div>
        <div className="day-container">
          <label className="year-label" htmlFor="month">
            {' '}
            Day
          </label>
          <DayPicker
            defaultValue=" "
            year={dateOfBirth.year} // mandatory
            month={dateOfBirth.month} // mandatory
            endYearGiven // mandatory if end={} is given in YearPicker
            required // default is false
            value={dateOfBirth.day} // mandatory
            onChange={(day) => {
            // mandatory
              setDateOfBirth((date) => ({ ...date, day }));
            }}
            id="day"
            name="day"
            classes="menu"
            optionClasses="option classes"
          />
        </div>
        <div className="year-container">
          <label className="year-label" htmlFor="year">
            {' '}
            Year
          </label>
          <YearPicker
            defaultValue={' '}
            start={startYear} // default is 1900
            end={endYear} // default is current year
            reverse // default is ASCENDING
            required // default is false
            value={dateOfBirth.year} // mandatory
            onChange={(year) => {
            // mandatory
              setDateOfBirth((date) => ({ ...date, year }));
            }}
            id="year"
            name="year"
            classes="menu"
            optionClasses="option classes"
          />
        </div>
      </div>
    </div>
  );
}

export default DatePicker;
