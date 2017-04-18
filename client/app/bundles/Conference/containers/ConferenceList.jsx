import React from 'react';
import Conference from './Conference';

const ConferenceList = React.createClass ({
  render: function() {
    var conferences = [];

    this.props.conferences.forEach(function(book) {
      conferences.push(<Conference conference={conference}
                         key={'conference' + conference.id}/>);
    }.bind(this));

    return(
      <table className="table table-striped" width="auto">
        <thead>
          <tr>          
            <th className="col-md-2">Name</th>           
          </tr>
        </thead>
        <tbody>
          {conferences}
        </tbody>
      </table>
    )
  }
});

export default ConferenceList;