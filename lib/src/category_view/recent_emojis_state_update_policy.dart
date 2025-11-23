/// Enum for defining the state update policy for recent emojis.
enum RecentEmojisStateUpdatePolicy {
  /// No state updates.
  never,

  /// State updates only when selected emoji is not from the recent list.
  notFromRecent,

  /// State updates on every emoji selection.
  always;

  /// Returns true if the policy is [never].
  bool get isNever => this == never;

  /// Returns true if the policy is [notFromRecent].
  bool get isNotFromRecent => this == notFromRecent;

  /// Returns true if the policy is [always].
  bool get isAlways => this == always;
}
