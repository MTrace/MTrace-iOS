class HomeViewController < UIViewController
  attr_accessor :menu_index
  MARGIN = {'x' => 20, 'y' => 80}

  def viewDidLoad
    super
    self.title ||= App.name

    mtrace_show(self.menu_index)
  end

  def mtrace_show(view)
    case view
    when 'Device' then
      self.send(:Device)
    else
      self.send(:Discover)
    end
  end

  def Device
    #puts 'Show Device.'

    text_view = UITextView.new
    text_view.font = UIFont.fontWithName("Courier New", size: 12)
    text_view.delegate = self
    text_view.backgroundColor = UIColor.whiteColor
    text_view.frame = CGRectMake(
      MARGIN['x'],
      MARGIN['y'],
      self.view.bounds.size.width - MARGIN['x'] * 2,
      self.view.bounds.size.height - MARGIN['y'] * 2
    )
    text_view.text = NetInterface.getInterfaceList().map {|k,v| "%8s\t%17s" % [k, v]}.join("\n")

    self.view.addSubview(text_view)
  end

  def Discover
    self.send(:Device)
  end

  #
  # テキストの編集が開始される直前に呼ばれる
  #
  def textViewShouldBeginEditing(textView)
    #puts 'Before begin'
    false # ここでfalseを返すと編集が開始されない
  end

  #
  # テキストの編集を開始したタイミングで呼ばれる
  #
  def textViewDidBeginEditing(textView)
    #puts 'Begin'
  end

  #
  # テキストの状態が変更されるタイミングで呼ばれる
  #
  def textViewDidChange(textView)
    #puts 'Change'
  end

  #
  # カーソルの動き、選択範囲の変更が行われるタイミングで呼ばれる
  #
  def textViewDidChangeSelection(textView)
    #puts 'Change Selection'
  end
end
