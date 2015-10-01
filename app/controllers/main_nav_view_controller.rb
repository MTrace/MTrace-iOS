class MTraceMainNavVC < UITableViewController
  CELL_ID = 'MTraceMainNavMenu'

  def viewDidLoad
    view.dataSource = view.delegate = self

    @menu = [
      'Discover',
      'Settings'
    ]
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @menu.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID)

    cell.text = @menu[indexPath.row]

    cell
  end
end
