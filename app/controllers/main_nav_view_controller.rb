class MTraceMainNavVC < UITableViewController
  CELL_ID = 'MTraceMainNavMenu'

  def viewDidLoad
    self.title = 'Navigation'

    view.dataSource = view.delegate = self

    @menu = [
      'Discover',
      'Device',
      'Settings'
    ]

    refreshControl = UIRefreshControl.new
    refreshControl.addTarget(self, action:"pull_refresh", forControlEvents:UIControlEventValueChanged)

    self.refreshControl = refreshControl
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @menu.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID)

    cell.text = @menu[indexPath.row]

    cell
  end

  def prepareForSegue(segue, sender:sender)
    if segue.identifier == 'Menu'
      indexPath = self.tableView.indexPathForSelectedRow

      @target = segue.destinationViewController
      @target.title = @menu[indexPath.row]
      @target.menu_index = @menu[indexPath.row]
    end
  end

  def pull_refresh
    view.reloadData

    self.refreshControl.endRefreshing
  end
end
