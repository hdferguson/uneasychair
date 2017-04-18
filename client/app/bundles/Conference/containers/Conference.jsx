import React from 'react';

const Conference = React.createClass ({
  propTypes: {
    name: React.PropTypes.string,
  },

  render: function() {
    return(
      <tr className="entry">   
        <td>{this.props.conference.name}</td>       
      </tr>
    )
  }
});

export default Conference;