using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Ecommerce.Data;
using ecommerceDemo.Models;

namespace ecommerceDemo.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsController : ControllerBase
    {
        private readonly EcommerceContext _context;

        public AccountsController(EcommerceContext context)
        {
            _context = context;
        }

/*        // GET: api/Accounts
        public async Task<IActionResult> Index()
        {
              return _context.Account != null ? 
                          View(await _context.Account.ToListAsync()) :
                          Problem("Entity set 'EcommerceContext.Account'  is null.");
        }*/

        // GET: api/Accounts
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Account>>> GetAccounts()
        {
            if (_context.Account == null)
            {
                return NotFound();
            }
            return await _context.Account.ToListAsync();
        }

        // GET: api/Accounts/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Account>> GetAccount(int id)
        {
            if (_context.Account == null)
            {
                return NotFound();
            }
            var account = await _context.Account.FindAsync(id);

            if (account == null)
            {
                return NotFound();
            }

            return account;
        }

        // POST: api/Accounts
        [HttpPost]
        public async Task<ActionResult<Account>> PostAccount(Account account)
        {
            if (_context.Account == null)
            {
                return Problem("Entity set 'EcommerceContext.Products'  is null.");
            }
            _context.Account.Add(account);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAccount", new { id = account.AccountId }, account);
        }

        /*        // GET: Accounts/Details/5
                public async Task<IActionResult> Details(int? id)
                {
                    if (id == null || _context.Account == null)
                    {
                        return NotFound();
                    }

                    var account = await _context.Account
                        .FirstOrDefaultAsync(m => m.AccountId == id);
                    if (account == null)
                    {
                        return NotFound();
                    }

                    return View(account);
                }*/

        /*        // GET: Accounts/Create
                public IActionResult Create()
                {
                    return View();
                }*/

        /*        // POST: Accounts/Create
                // To protect from overposting attacks, enable the specific properties you want to bind to.
                // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
                [HttpPost]
                [ValidateAntiForgeryToken]
                public async Task<IActionResult> Create([Bind("AccountId,UserName,Email,Phone,Region,Pass")] Account account)
                {
                    if (ModelState.IsValid)
                    {
                        _context.Add(account);
                        await _context.SaveChangesAsync();
                        return RedirectToAction(nameof(Index));
                    }
                    return View(account);
                }*/

        /*        // GET: Accounts/Edit/5
                public async Task<IActionResult> Edit(int? id)
                {
                    if (id == null || _context.Account == null)
                    {
                        return NotFound();
                    }

                    var account = await _context.Account.FindAsync(id);
                    if (account == null)
                    {
                        return NotFound();
                    }
                    return View(account);
                }*/

        /*        // POST: Accounts/Edit/5
                // To protect from overposting attacks, enable the specific properties you want to bind to.
                // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
                [HttpPost]
                [ValidateAntiForgeryToken]
                public async Task<IActionResult> Edit(int id, [Bind("AccountId,UserName,Email,Phone,Region,Pass")] Account account)
                {
                    if (id != account.AccountId)
                    {
                        return NotFound();
                    }

                    if (ModelState.IsValid)
                    {
                        try
                        {
                            _context.Update(account);
                            await _context.SaveChangesAsync();
                        }
                        catch (DbUpdateConcurrencyException)
                        {
                            if (!AccountExists(account.AccountId))
                            {
                                return NotFound();
                            }
                            else
                            {
                                throw;
                            }
                        }
                        return RedirectToAction(nameof(Index));
                    }
                    return View(account);
                }*/

        /*        // GET: Accounts/Delete/5
                public async Task<IActionResult> Delete(int? id)
                {
                    if (id == null || _context.Account == null)
                    {
                        return NotFound();
                    }

                    var account = await _context.Account
                        .FirstOrDefaultAsync(m => m.AccountId == id);
                    if (account == null)
                    {
                        return NotFound();
                    }

                    return View(account);
                }*/

/*        // POST: Accounts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Account == null)
            {
                return Problem("Entity set 'EcommerceContext.Account'  is null.");
            }
            var account = await _context.Account.FindAsync(id);
            if (account != null)
            {
                _context.Account.Remove(account);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }*/

        private bool AccountExists(int id)
        {
          return (_context.Account?.Any(e => e.AccountId == id)).GetValueOrDefault();
        }
    }
}
