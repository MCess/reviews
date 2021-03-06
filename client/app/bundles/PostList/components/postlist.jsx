import React from 'react'
import Post from '../../Post/components/post'
import NewReview from '../../NewReview/components/newReview'

export default class PostList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {posts: this.props.posts,
                  showComponent: false}

    this.handleClick = this.handleClick.bind(this);
    this.unshowComponent = this.unshowComponent.bind(this);
  }

  handleClick(event) {
    this.setState({showComponent: true});
    $.ajax({
      url: `/posts/indextwo`,
      type: 'GET',
      me: this,
      success:  (data) => {
        this.setState({
          posts: post
        })
      }
    })
  }

  unshowComponent(event) {
    this.setState({showComponent: false})
    $.ajax({
      url: `/posts/indextwo`,
      type: 'GET',
      me: this,
      success:  (data) => {
        this.setState({
          posts: post
        })
      }
    })
  }

  removeItemClient(id) {
    var newPosts = {}

    for (var key in this.state.posts) {
      if (key !== id) {
        newPosts[key] = this.state.posts[key]
      }
    }
    this.setState({ posts: newPosts })

  }

  handleDelete(id) {
    $.ajax({
      url: "/posts/"+id,
            type: 'DELETE'
    });

  }

  render() {
    var that = this
    const reviews = this.state.posts
    var handleDelete = this.handleDelete
    var removeClient = this.removeItemClient
    var array = Object.keys(reviews)
    var unshow = this.unshowComponent

    const posts = Object.keys(reviews).map(function(post) {
    return (
      <Post key={reviews[post].id} handleDelete={handleDelete} post={reviews[post]} removeClient={removeClient} that={that} unshow={unshow} />
      );

    });

    return (
      <div>
        <div>
        <div style={{paddingBottom:"30px"}} >
          <button className="button1" style={{float: "right"}} onClick={this.handleClick}>
            Add New Review
          </button>
          </div>
          <br />
          <br />
          {this.state.showComponent ?
            <NewReview members={this.props.members} unshowComponent={this.unshowComponent} /> :
            null}
        </div>
        <div>
          {posts}
        </div>
      </div>
    )
  }
}


