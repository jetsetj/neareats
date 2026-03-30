export default function handler(_req, res) {
  const url = process.env.SUPABASE_URL || "";
  const key = process.env.SUPABASE_ANON_KEY || "";

  res.setHeader("Cache-Control", "no-store");
  return res.status(200).json({
    SUPABASE_URL: url,
    SUPABASE_ANON_KEY: key,
  });
}
