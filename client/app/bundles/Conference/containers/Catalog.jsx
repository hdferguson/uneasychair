import React, { PropTypes } from 'react';
import ConferenceList from './ConferenceList';

const Catalog = React.createClass ({
  getInitialState: function() {
        return { conferences: [] };
  },  

  componentDidMount: function() {
        this.setState({ conferences: this.props.catalog });
  },

  render() {
    return (
      <div className="container">
        <div className="row">
          <div className="col-md-12">
              <ConferenceList conferences={this.state.conferences}/>
          </div>
        </div>
      </div>
    );
  }
});

export default Catalog;