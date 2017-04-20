import React from 'react';
//import createReactClass from 'create-react-class'
import PropTypes from 'prop-types';

const Conference = React.createClass ({
  propTypes: {
    name: PropTypes.string,
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